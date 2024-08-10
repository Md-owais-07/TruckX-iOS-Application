//
//  SplashVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class SplashVC: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateBasedOnLoginStatus()
        
    }
    
    private func navigateBasedOnLoginStatus() {
        if UserData.shared.isLoggedIn {
            navigateToDashboard()
        } else {
            navigateToLogin()
        }
    }
    
    private func navigateToDashboard() {
        let dashboardVC = AppController.shared.Tabbar
        let navigationController = UINavigationController(rootViewController: dashboardVC)
        navigationController.isNavigationBarHidden = true
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    private func navigateToLogin() {
        let loginVC = AppController.shared.Login
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.isNavigationBarHidden = true
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
}
