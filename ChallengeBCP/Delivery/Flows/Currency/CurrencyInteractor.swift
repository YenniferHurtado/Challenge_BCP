//
//  CurrencyInteractor.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation

protocol CurrencyInteractorProtocol {
    
}

final class CurrencyInteractor: CurrencyInteractorProtocol {
    private let dependencies: CurrencyInteractorDependenciesProtocol
    
    init(dependencies: CurrencyInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
