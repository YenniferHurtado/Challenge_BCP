//
//  HomePresenter.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import Foundation
import Combine

protocol HomePresenterProtocol {
    var result: [String] { get set }
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    var result: [String] = []
    
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
}
