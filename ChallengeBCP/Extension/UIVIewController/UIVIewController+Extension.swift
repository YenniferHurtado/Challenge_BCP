//
//  UIVIewController+Extension.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//

import Foundation
import MBProgressHUD

extension UIViewController {
    
    func showHud() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideHud() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
