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
    
    private var presenter: HomePresenter
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewDidLoad() {
        addSubView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func didTapChangeCurrency(_ sender: Any) {
        
    }
    
}

//MARK: UIView
extension HomeViewController {
    
    func setupUI() {

    }
    
    func addSubView() {

        
    }
    
}
