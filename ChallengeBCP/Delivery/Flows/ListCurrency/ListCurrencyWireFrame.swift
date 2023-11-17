//
//  ListCurrencyWireFrame.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//  
//


import UIKit

protocol ListCurrencyWireFrameProtocol {
   static func makeListCurrencyView() -> UIViewController
}

struct ListCurrencyWireFrame: ListCurrencyWireFrameProtocol {
    static func makeListCurrencyView() -> UIViewController {
        
        let interactorDependencies = ListCurrencyInteractorDependencies()
        let interactor = ListCurrencyInteractor(dependencies: interactorDependencies)
        let presenter = ListCurrencyPresenter(interactor: interactor)
        let view = ListCurrencyViewController(presenter: presenter)
        
        return view
    }
}
