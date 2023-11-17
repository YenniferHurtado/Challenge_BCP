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
    
    @IBOutlet weak var firstCurrencyButton: UIButton!
    @IBOutlet weak var secondCurrencyButton: UIButton!
    
    @IBOutlet weak var receiveTextfield: UITextField!
    @IBOutlet weak var sendTextfield: UITextField!
    @IBOutlet weak var arrowCircleButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var presenter: HomePresenter
    private var isDataSuccess: Bool = false
    private var isConversionToUSD: Bool = false

    var longPressGesture: UILongPressGestureRecognizer!
    var longPressTimer: Timer?
    let titlesButton = ["Dólares", "Soles"]

    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitlesButton()
        isConversionToUSD.toggle()
        longPressArrowCircleButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listedRates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func didTapStartOperation(_ sender: Any) {
        presenter.convertCurreny(sendText: sendTextfield.text,
                                 receiveText: &receiveTextfield.text, 
                                 isConversionToUSD: isConversionToUSD)
    }
    
    @IBAction func didTapArrowButton(_ sender: Any) {
        changeTitleNameOfButtons()
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

//MARK: SETUP UI

extension HomeViewController {
    
    func longPressArrowCircleButton() {
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        longPressGesture.minimumPressDuration = 0.5
        arrowCircleButton.addGestureRecognizer(longPressGesture)
    }
    
    @objc func longPress() {
        let controller = ListCurrencyWireFrame.makeListCurrencyView()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func setTitlesButton() {
        firstCurrencyButton.setTitle(titlesButton[0], for: .normal) //USD
        secondCurrencyButton.setTitle(titlesButton[1], for: .normal) //PEN
    }
    
    func changeTitleNameOfButtons() {
        if firstCurrencyButton.titleLabel?.text == titlesButton[0] &&
           secondCurrencyButton.titleLabel?.text == titlesButton[1]{
            
            firstCurrencyButton.setTitle(titlesButton[1], for: .normal) //PEN
            secondCurrencyButton.setTitle(titlesButton[0], for: .normal) //USD
            isConversionToUSD.toggle()
            
        } else {
            
            firstCurrencyButton.setTitle(titlesButton[0], for: .normal) //USD
            secondCurrencyButton.setTitle(titlesButton[1], for: .normal) //PEN
            isConversionToUSD.toggle()
        }
    }
}
