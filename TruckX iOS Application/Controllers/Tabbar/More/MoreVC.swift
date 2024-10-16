//
//  MoreVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class MoreVC: BaseViewController {
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
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnRotate: UIButton!
    @IBOutlet weak var btnUpdates: UIButton!
    @IBOutlet weak var imgRotation: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var guestLoginView: UIView!
    
    private var preferredSheetHeight: CGFloat = 246
    private var isLandscape = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bottomView.isHidden = true
        guestLoginView.isHidden = true
        
        imgRotation.image = UIImage(named: "Rotate-img")
        
        lblUserName.text = UserData.shared.isLoggedIn ? "\(UserData.shared.firstName) \(UserData.shared.lastName)" : "\(UserData.shared.guestName)"
        
        if UserData.shared.isGuestUser {
            logoutView.isHidden = true
            guestLoginView.isHidden = false
        } else if UserData.shared.isLoggedIn {
            logoutView.isHidden = false
            guestLoginView.isHidden = true
        }
        
        applyViewStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        disablePopGestureRecognizer()
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        let vc = AppController.shared.LogoutAlert
        preferredSheetHeight = UIScreen.main.bounds.height
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .custom
        navigationController.transitioningDelegate = self
        
        present(navigationController, animated: true)
    }
    
    @IBAction func exemptionButtonAction(_ sender: Any) {
        let vc = AppController.shared.Exemption
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dotInspectionButtonTapped(_ sender: Any) {
        let vc = AppController.shared.BottomSheet
        preferredSheetHeight = 246
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .custom
        navigationController.transitioningDelegate = self
        
        present(navigationController, animated: true)
    }
    
    @IBAction func truckandTrailerButtonAction(_ sender: Any) {
        let truckVC = AppController.shared.TruckAndTrailer
        truckVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(truckVC, animated: true)
    }
    
    @IBAction func cycleInfoVuttonAction(_ sender: Any) {
        let cycleInfo = AppController.shared.CycleInformation
        cycleInfo.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cycleInfo, animated: true)
    }
    
    @IBAction func carrierInfoButtonAction(_ sender: Any) {
        let carrierInfo = AppController.shared.CarrierInformation
        carrierInfo.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(carrierInfo, animated: true)
    }
    
    @IBAction func appSettingButtonAction(_ sender: Any) {
        let appSettings = AppController.shared.AppSettings
        appSettings.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(appSettings, animated: true)
    }
    
    @IBAction func rotateButtonAction(_ sender: UIButton) {
        isLandscape.toggle()
        
        if isLandscape {
            self.imgRotation.image = UIImage(named: "Rotate-lock-img")
            OrientationManager.shared.forceLandscape()
        } else {
            self.imgRotation.image = UIImage(named: "Rotate-img")
            OrientationManager.shared.forcePortrait()
        }
    }
    
    @IBAction func guestLoginButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainView.alpha = 0
        }, completion: { _ in
            UserData.shared.isLoggedIn = false
            UserData.shared.isGuestUser = false
            let loginVC = AppController.shared.LandingPage
            let newNavController = UINavigationController(rootViewController: loginVC)
            self.navigationItem.hidesBackButton = true
            self.navigationController?.isNavigationBarHidden = true
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = newNavController
                window.makeKeyAndVisible()
            }
        })
    }
    
}


extension MoreVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting, preferredHeight: preferredSheetHeight)
    }
}

extension MoreVC {
    func applyViewStyle()
    {
        dotView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        truckView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        exemptionView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        cycleView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        carrierView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        settingView.applyShadowStyle(cornerRadius: 16, shadowOpacity: 0.2, shadowColor: .systemGray3)
        mainView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
    }
}
