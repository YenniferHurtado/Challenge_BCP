//
//  RequestProtocol.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//

import Foundation
import Combine
import SwiftyJSON

protocol RequestProtocol {
    var session: URLSession { get set }
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue,
                    retries: Int) -> AnyPublisher<T, RequestError> where T: Decodable
}

extension RequestProtocol {
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, RequestError> where T: Decodable {
        
        print("REQUEST: \(request)")
        return session.dataTaskPublisher(for: request)
        
            .tryMap { (data, response) in
                guard  let validate = response as? HTTPURLResponse, validate.statusCode == 200 else {
                    let decode = try JSONDecoder().decode(RequestError.self, from: data)
                    throw decode
                }
                print("RESPONSE SUCCESS: \(JSON(data)) \n")
                return data
            }
        
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({
                let error = $0 as? RequestError ?? RequestError.default
                print("RESPONSE ERROR: \($0)\n")
                return error
            })
        
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
