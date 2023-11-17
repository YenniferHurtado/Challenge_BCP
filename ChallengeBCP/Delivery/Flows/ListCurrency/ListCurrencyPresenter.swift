//
//  ListCurrencyPresenter.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//  
//


import Foundation
import Combine

protocol ListCurrencyPresenterProtocol {
    var result: [String] { get set }
}

final class ListCurrencyPresenter: ListCurrencyPresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: ListCurrencyInteractorProtocol
    
    init(interactor: ListCurrencyInteractorProtocol) {
        self.interactor = interactor
    }
}
