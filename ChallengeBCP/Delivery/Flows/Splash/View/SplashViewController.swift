//
//  SplashViewController.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import UIKit

class SplashViewController: UIViewController {
        
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHud()
    }
    
    // Simulate show home
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            let controller = HomeWireFrame.makeHomeView()
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: false)
        }
    }
}
