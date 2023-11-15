//
//  CurrencyWireFrame.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import UIKit

protocol CurrencyWireFrameProtocol {
   static func makeCurrencyView() -> UIViewController
}

struct CurrencyWireFrame: CurrencyWireFrameProtocol {
    static func makeCurrencyView() -> UIViewController {
        
        let interactorDependencies = CurrencyInteractorDependencies()
        let interactor = CurrencyInteractor(dependencies: interactorDependencies)
        let presenter = CurrencyPresenter(interactor: interactor)
        let view = CurrencyViewController(presenter: presenter)
        
        return view
    }
}
