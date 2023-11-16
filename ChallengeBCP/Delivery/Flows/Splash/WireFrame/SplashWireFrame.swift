//
//  SplashWireFrame.swift
//  ChallengeBCP
//
//  Created by Yennifer Hurtado Arce on 15/11/23.
//  
//


import UIKit

protocol SplashWireFrameProtocol {
   static func makeSplashView() -> UIViewController
}

struct SplashWireFrame: SplashWireFrameProtocol {
    static func makeSplashView() -> UIViewController {
        
        let view = SplashViewController()
        
        return view
    }
}
