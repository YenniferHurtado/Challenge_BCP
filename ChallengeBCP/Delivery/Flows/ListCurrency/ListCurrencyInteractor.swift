//
//  ListCurrencyInteractor.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//  
//


import Foundation

protocol ListCurrencyInteractorProtocol {
    
}

final class ListCurrencyInteractor: ListCurrencyInteractorProtocol {
    private let dependencies: ListCurrencyInteractorDependenciesProtocol
    
    init(dependencies: ListCurrencyInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
