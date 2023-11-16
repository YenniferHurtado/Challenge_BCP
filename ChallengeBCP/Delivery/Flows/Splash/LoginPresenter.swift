//
//  LoginPresenter.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation
import Combine

protocol SplashPresenterProtocol {
    var result: [String] { get set }
}

final class SplashPresenter: SplashPresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: SplashInteractorProtocol
    
    init(interactor: SplashInteractorProtocol) {
        self.interactor = interactor
    }
}
