//
//  ListCurrencyViewController.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 17/11/23.
//  
//


import UIKit

class ListCurrencyViewController: UIViewController {
    
    private var presenter: ListCurrencyPresenter
    
    init(presenter: ListCurrencyPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
