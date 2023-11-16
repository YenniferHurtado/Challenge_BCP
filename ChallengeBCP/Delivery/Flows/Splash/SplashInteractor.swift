//
//  SplashInteractor.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation

protocol SplashInteractorProtocol {
    
}

final class SplashInteractor: SplashInteractorProtocol {
    private let dependencies: SplashInteractorDependenciesProtocol
    
    init(dependencies: SplashInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
