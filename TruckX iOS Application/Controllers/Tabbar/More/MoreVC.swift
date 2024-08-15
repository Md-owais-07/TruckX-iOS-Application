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
        bottomView.isHidden = true
        
        dotView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        truckView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        exemptionView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        cycleView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        carrierView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        settingView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        logoutView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        DispatchQueue.main.async {
            let logoutAlert = AppController.shared.LogoutAlert
            logoutAlert.modalTransitionStyle = .crossDissolve
            logoutAlert.modalPresentationStyle = .overCurrentContext
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController {
                rootVC.present(logoutAlert, animated: false, completion: nil)
            } else {
                print("Error: No active window found.")
            }
        }
    }
    
    @IBAction func exemptionButtonAction(_ sender: Any) {
        let vc = AppController.shared.Exemption
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dotInspectionButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            let bottomSheet = AppController.shared.BottomSheet
            bottomSheet.modalTransitionStyle = .crossDissolve
            bottomSheet.modalPresentationStyle = .overCurrentContext
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController {
                rootVC.present(bottomSheet, animated: false, completion: nil)
            } else {
                print("Error: No active window found.")
            }
        }
    }
    
}
