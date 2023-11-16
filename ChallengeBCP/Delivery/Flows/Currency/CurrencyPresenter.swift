//
//  CurrencyPresenter.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation
import Combine

protocol CurrencyPresenterProtocol {
    var result: [String] { get set }
}

final class CurrencyPresenter: CurrencyPresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: CurrencyInteractorProtocol
    
    init(interactor: CurrencyInteractorProtocol) {
        self.interactor = interactor
    }
}
