//
//  LandingVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 11/10/24.
//

import UIKit

class LandingVC: UIViewController {
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnGuest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        btnLogin.layer.cornerRadius = self.btnLogin.frame.height / 2
        btnLogin.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        disablePopGestureRecognizer()
    }
    
    @objc func loginTapped() {
        let vc = AppController.shared.Login
        self.pushToVC(vc)
    }
    
    @IBAction func guestTapped(_ sender: Any) {
        let vc = AppController.shared.Tabbar
        UserData.shared.isGuestUser = true
        UserData.shared.isLoggedIn = false
        UserData.shared.guestName = "Guest"
        
        LottieLoaderManager.shared.showLoader(in: self.view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.pushToVC(vc)
        }
    }

}
