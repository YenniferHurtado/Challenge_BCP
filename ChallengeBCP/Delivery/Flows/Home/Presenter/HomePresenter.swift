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
    func listedRates(completion: @escaping (Bool) -> Void)
    var rateSelected: [String: Double] { get }
    var result: [String] { get set }
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    
    var rateSelected: [String : Double] = [:]
    var result: [String] = []
    
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
    
    func listedRates(completion: @escaping (Bool) -> Void) {
        let params = [URLQueryItem(name: "access_key", value: KeychainLoadHash.getkey())]
        interactor.listedRates(query: params) { result in
            print(result)
        }
    }
}
