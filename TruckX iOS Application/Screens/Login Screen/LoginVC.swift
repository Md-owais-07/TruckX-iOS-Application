//
//  ViewController.swift
//  TruckX iOS Application
//
//  Created by Owais on 09/08/24.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var imgCheckStatus: UIImageView!
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var lblHeight: NSLayoutConstraint!
    @IBOutlet weak var btnToggele: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    var isPasswordVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLabel()
        labelHeight()
        
        radioButton.addTarget(self, action: #selector(agreeButtonTerms), for: .touchUpInside)
        
        self.imgCheckStatus.image = UIImage(named: "ri_checkbox-line")
        
        btnLogin.layer.cornerRadius = 10
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        bottomView.isHidden = true
        
        self.HideKeyboardWhenTapAround()
    }
    
    @IBAction func loginBtnction(_ sender: Any) {
        print("loginBtnction")
        UserData.shared.isLoggedIn = true
        let dashboardVC = AppController.shared.Tabbar
        let navigationController = UINavigationController(rootViewController: dashboardVC)
        navigationController.navigationItem.hidesBackButton = true
        navigationController.isNavigationBarHidden = true
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
    
    @IBAction func passwordButtonToggle(_ sender: Any) {
        isPasswordVisible.toggle()
        let imageName = isPasswordVisible ? "eye" : "eye.slash.fill"
        btnToggele.setImage(UIImage(systemName: imageName), for: .normal)
        passwordTextfield.isSecureTextEntry = !isPasswordVisible
    }
    
}
