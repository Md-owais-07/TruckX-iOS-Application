//
//  TabBarVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class TabBarVC: UITabBarController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.2041797638, green: 0.7158635259, blue: 0.7573852539, alpha: 1)
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.4983439445, green: 0.5182951093, blue: 0.560801208, alpha: 1)
        UITabBar.appearance().selectionIndicatorImage = UIImage(named: AppAssets.tabbar_shadow.rawValue)
        
        if UIDevice.current.hasNotch {
            UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 7)
        }
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let home = AppController.shared.Home
        let logbook = AppController.shared.Logbook
        let messege = AppController.shared.Messgege
        let more = AppController.shared.More
        let homeBarItem = UITabBarItem(title: "Home", image: UIImage(named: AppAssets.tabbar_home.rawValue), selectedImage: UIImage(named: AppAssets.tabbar_home.rawValue))
        home.tabBarItem = homeBarItem
        if UIDevice.current.hasNotch {
            home.tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: -7, right: 0)
        }
        
        let menueBarItem = UITabBarItem(title: "Logbook", image: UIImage(named: AppAssets.tabbar_logbook.rawValue), selectedImage: UIImage(named: AppAssets.tabbar_logbook.rawValue))
        logbook.tabBarItem = menueBarItem
        if UIDevice.current.hasNotch {
            logbook.tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: -7, right: 0)
        }
        
        let profileBarItem = UITabBarItem(title: "Messeges", image: UIImage(named: AppAssets.tabbar_messgae.rawValue), selectedImage: UIImage(named: AppAssets.tabbar_messgae.rawValue))
        messege.tabBarItem = profileBarItem
        if UIDevice.current.hasNotch {
            messege.tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: -7, right: 0)
        }
        
        let mycartBarItem = UITabBarItem(title: "More", image: UIImage(named: AppAssets.tabbar_more.rawValue), selectedImage: UIImage(named: AppAssets.tabbar_more.rawValue))
        more.tabBarItem = mycartBarItem
        if UIDevice.current.hasNotch {
            more.tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: -7, right: 0)
        }
        
        let homeWithNav = UINavigationController(rootViewController: home)
        homeWithNav.interactivePopGestureRecognizer!.delegate = self
        homeWithNav.interactivePopGestureRecognizer!.isEnabled = true
        let menuWithNav = UINavigationController(rootViewController: logbook)
        menuWithNav.interactivePopGestureRecognizer!.delegate = self
        menuWithNav.interactivePopGestureRecognizer!.isEnabled = true
        let profileWithNav = UINavigationController(rootViewController: messege)
        profileWithNav.interactivePopGestureRecognizer!.delegate = self
        profileWithNav.interactivePopGestureRecognizer!.isEnabled = true
        let mycartWithNav = UINavigationController(rootViewController: more)
        mycartWithNav.interactivePopGestureRecognizer!.delegate = self
        mycartWithNav.interactivePopGestureRecognizer!.isEnabled = true
        homeWithNav.isNavigationBarHidden = true
        menuWithNav.isNavigationBarHidden = true
        profileWithNav.isNavigationBarHidden = true
        mycartWithNav.isNavigationBarHidden = true
        
        viewControllers = [homeWithNav,menuWithNav,profileWithNav,mycartWithNav]
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension UIDevice {
    var hasNotch: Bool {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
              let window = windowSceneDelegate.window else {
            return false
        }
        return window?.safeAreaInsets.top ?? 0 > 20
    }
}
