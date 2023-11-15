//
//  HomeInteractor.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation

protocol HomeInteractorProtocol {
    
}

final class HomeInteractor: HomeInteractorProtocol {
    private let dependencies: HomeInteractorDependenciesProtocol
    
    init(dependencies: HomeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
