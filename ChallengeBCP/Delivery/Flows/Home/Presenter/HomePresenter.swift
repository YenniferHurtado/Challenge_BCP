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
    var usdRate: Double { get set }
    var penRate: Double { get set }

    var rates: [String: Double] { get set }
    var error: RequestError { get set }
}

final class HomePresenter: HomePresenterProtocol, ObservableObject {
    
    var usdRate: Double = 0.0
    var penRate: Double = 0.0
    var rates: [String : Double] = [:]
    var error: RequestError = RequestError.default

    private let interactor: HomeInteractorProtocol
    weak var view: HomeViewController?
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
    
    func listedRates(completion: @escaping (Bool) -> Void) {
        let params = [URLQueryItem(name: "access_key", value: KeychainLoadHash.getkey())]
        interactor.listedRates(query: params) { [weak self] result in
            
            guard let self = self else { return }
            switch result {
            case .success(let success):
                
                self.rates = success.rates
                
                if let usdRate = success.rates["USD"],
                    let penRate = success.rates["PEN"] {
                    self.usdRate = usdRate
                    self.penRate = penRate
                }

                completion(success.success)
            case .failure(let failure):
                self.error = failure
                completion(false)
            }
        }
    }
    
    func convertCurreny(sendText: String?, receiveText: inout String?) {
        
        if let amountText = sendText,
           let amount = Double(amountText),
           amount >= 0 {
            
            let ratePENtoUSD = penRate / usdRate
            let result = amount * ratePENtoUSD
            
            receiveText = String(format: "%.2f", result)
            
        } else {
            showError()
        }
    }
    
    func showUSDrates(isDataSuccess: Bool) -> (String, String) {
        
        var buy = ""
        var sell = ""

        if isDataSuccess {
            
            let ratePENtoUSD = penRate / usdRate
                    
            buy = String(format: "%.2f", ratePENtoUSD)
            sell = String(format: "%.2f", ratePENtoUSD + 0.03)
            
        }
        
        return (buy, sell)
    }
    
    func showError() {
        
        guard let view = self.view else {
            return
        }
        Alert.showEmptyAlert(on: view, title: "Error",
                             message: "Intentar nuevamente",
                             handler: view.reloadList)
    }
    
}
