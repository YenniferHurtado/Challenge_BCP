//
//  HomeViewController.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var sendView: UIView!
    @IBOutlet weak var receiveView: UIView!
    
    @IBOutlet weak var usdButton: UIButton!
    @IBOutlet weak var penButton: UIButton!
        
    @IBOutlet weak var receiveTextfield: UITextField!
    @IBOutlet weak var sendTextfield: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var presenter: HomePresenter
    private var isDataSuccess: Bool =  false
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listedRates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func diidTapChangeCurrency(_ sender: Any) {
        presenter.convertCurreny(sendText: sendTextfield.text,
                                 receiveText: &receiveTextfield.text)
    }

}

//MARK: FUNCTIONS
extension HomeViewController {
    
    func buySellLabel() {
        let (buy, sell) = presenter.showUSDrates(isDataSuccess: isDataSuccess)
        resultLabel.text = "Compra: \(buy) | Venta: \(sell)"
    }


    func listedRates() {
        presenter.listedRates {  [weak self] isSuccess in
            guard let self = self else { return }
            if isSuccess {
                self.isDataSuccess = true
                buySellLabel()
            } else {
                presenter.showError()
            }
        }
    }
    
    @objc func reloadList(_ sender: UIAlertAction) {
        listedRates()
    }
}

