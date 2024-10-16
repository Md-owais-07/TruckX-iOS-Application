//
//  SplashVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class SplashVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateBasedOnLoginStatus()
    }
    
    private func navigateBasedOnLoginStatus() {
        if UserData.shared.isLoggedIn {
            navigateToDashboard()
        } else {
            newUserNavigation()
        }
    }
    
//    private func navigateBasedOnLoginStatus() {
//        if UserData.shared.isNewUser {
//            newUserNavigation()
////            UserData.shared.isNewUser = false 
//        } else if UserData.shared.isLoggedIn {
//            navigateToDashboard()
//        } else {
//            navigateToLogin()
//        }
//    }
    
    private func newUserNavigation() {
        let tabVC = AppController.shared.LandingPage
        let navigationController = UINavigationController(rootViewController: tabVC)
        navigationController.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    private func navigateToDashboard() {
        let tabVC = AppController.shared.Tabbar
        let navigationController = UINavigationController(rootViewController: tabVC)
        navigationController.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
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
        self.navigationItem.hidesBackButton = true
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
}


//class SplashVC: UIViewController, UIGestureRecognizerDelegate {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigateBasedOnLaunchStatus()
//    }
//    
//    private func navigateBasedOnLaunchStatus() {
//        // Check if the app has been launched before
//        if UserData.shared.isNewUser {
//            // Show new user screen on the very first launch
//            newUserNavigation()
//            // Set isNewUser to false, so the new user screen is not shown again
////            UserData.shared.isNewUser = false
//        } else {
//            // Proceed with regular login status check
//            navigateBasedOnLoginStatus()
//        }
//    }
//    
//    private func navigateBasedOnLoginStatus() {
//        if UserData.shared.isLoggedIn {
//            navigateToDashboard()
//        } else {
//            navigateToLogin()
//        }
//    }
//    
//    private func newUserNavigation() {
//        let newUserVC = AppController.shared.LandingPage // Replace with actual New User screen controller
//        self.pushToVC(newUserVC)
//    }
//    
//    private func navigateToDashboard() {
//        let dashboardVC = AppController.shared.Tabbar
//        setRootViewController(dashboardVC)
//    }
//    
//    private func navigateToLogin() {
//        let loginVC = AppController.shared.Login // Assuming the same as login
//        setRootViewController(loginVC)
//    }
//    
//    // Helper function to set the root view controller
//    private func setRootViewController(_ viewController: UIViewController) {
//        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.isNavigationBarHidden = true
//        self.navigationItem.hidesBackButton = true
//        
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let window = windowScene.windows.first {
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
//    }
//}
