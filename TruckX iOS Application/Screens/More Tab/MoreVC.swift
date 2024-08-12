//
//  MoreVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class MoreVC: UIViewController {
    @IBOutlet weak var rotateView: UIView!
    @IBOutlet weak var updateView: UIView!
    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var truckView: UIView!
    @IBOutlet weak var exemptionView: UIView!
    @IBOutlet weak var cycleView: UIView!
    @IBOutlet weak var carrierView: UIView!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnExemption: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(unhideTab), name: NSNotification.Name("Unhide"), object: nil)
        
        bottomView.isHidden = true
        
        dotView.applyCardStyle()
        truckView.applyCardStyle()
        exemptionView.applyCardStyle()
        cycleView.applyCardStyle()
        carrierView.applyCardStyle()
        settingView.applyCardStyle()
        logoutView.applyCardStyle()
    }
    
    @objc func unhideTab() {
        UIView.animate(withDuration: 0.5, animations: {
            self.tabBarController?.tabBar.alpha = 1
        }, completion: { _ in
            self.tabBarController?.tabBar.isHidden = false
        })
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("Unhide"), object: nil)
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        
        let loginVC = AppController.shared.Login
        
        let newNavController = UINavigationController(rootViewController: loginVC)
        
        if let window = UIApplication.shared.keyWindow {
            window.rootViewController = newNavController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
        
        UserData.shared.isLoggedIn = false
    }
    
    @IBAction func exemptionButtonAction(_ sender: Any) {
        let vc = AppController.shared.Exemption
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func dotInspectionButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let bottomSheetVC = storyboard.instantiateViewController(withIdentifier: "BottomSheetVC_id") as? BottomSheetVC {
            bottomSheetVC.modalPresentationStyle = .overCurrentContext
            self.tabBarController?.tabBar.isHidden = true
            bottomSheetVC.modalTransitionStyle = .crossDissolve
            self.present(bottomSheetVC, animated: false, completion: nil)
        }
    }
}
