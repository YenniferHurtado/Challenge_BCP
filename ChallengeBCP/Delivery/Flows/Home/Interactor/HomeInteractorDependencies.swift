//
//  HomeInteractorDependencies.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation
import Combine

protocol HomeInteractorDependenciesProtocol {
    func listRates(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<HomeEntity, RequestError>
}

class HomeInteractorDependencies: RequestProtocol, HomeInteractorDependenciesProtocol {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func listRates(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<HomeEntity, RequestError> {
        execute(feedKind.request(query: query), decodingType: HomeEntity.self)
    }
}
