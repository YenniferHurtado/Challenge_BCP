//
//  HomeInteractor.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation
import Combine

protocol HomeInteractorProtocol {
    func listedRates(query: [URLQueryItem], completion: @escaping (Result<HomeEntity, RequestError>) -> Void)
}

final class HomeInteractor: HomeInteractorProtocol {
        
    private let dependencies: HomeInteractorDependenciesProtocol
    private var cancellable: AnyCancellable?

    init(dependencies: HomeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func listedRates(query: [URLQueryItem], completion: @escaping (Result<HomeEntity, RequestError>) -> Void) {
        
        cancellable = dependencies.listRates(query: query, .listRates) 
            .sink(receiveCompletion: { result in
                switch result {
                case .finished: break
                case .failure(let error):
                    completion(.failure(error))
                }
            }, receiveValue: {
                completion(.success($0))
        })
    }

}
