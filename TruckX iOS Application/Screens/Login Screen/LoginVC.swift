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
    private let loaderView = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLabel()
        labelHeight()
        setupLoader()
        
        radioButton.addTarget(self, action: #selector(agreeButtonTerms), for: .touchUpInside)
        
        self.imgCheckStatus.image = UIImage(named: "ri_checkbox-line")
        
        btnLogin.layer.cornerRadius = 10
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        bottomView.isHidden = true
        
        self.HideKeyboardWhenTapAround()
    }
    
    private func setupLoader() {
        loaderView.frame = view.bounds
        loaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // Ensure it resizes with the main view
        view.addSubview(loaderView)
        loaderView.isHidden = true
    }
    
    private func showLoader() {
        loaderView.startLoading()
    }
    
    private func hideLoader() {
        loaderView.stopLoading()
    }
    
    @IBAction func loginBtnction(_ sender: Any) {
        
        guard let email = emailTextfield.text,  email != "" else {
            Toast.shared.toastView(toastMessage: "Please enter your email address.", type: "error")
            return
        }
        guard let password = passwordTextfield.text, password != "" else {
            Toast.shared.toastView(toastMessage: "Please enter your Password.", type: "error")
            return
        }
        guard password.count >= 6 else {
            Toast.shared.toastView(toastMessage: "Please enter atleast 6 or more characters.", type: "error")
            return
        }
        
        showLoader()
        
        APIManager.shared.signIn(email: emailTextfield.text!, password: passwordTextfield.text!) { result in
            DispatchQueue.main.async {
                self.hideLoader()
                switch result {
                case .success(let accessToken):
                    Toast.shared.toastView(toastMessage: "Login Success!!", type: "success")
                    UserData.shared.isLoggedIn = true
                    UserData.shared.currentAuthKey = accessToken
                    let tabBarController = AppController.shared.Tabbar
                    
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first {
                        window.rootViewController = tabBarController
                        window.makeKeyAndVisible()
                    }
                    print("Login Success, with Access Token: \(accessToken)")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    @IBAction func passwordButtonToggle(_ sender: Any) {
        isPasswordVisible.toggle()
        let imageName = isPasswordVisible ? "eye" : "eye.slash.fill"
        btnToggele.setImage(UIImage(systemName: imageName), for: .normal)
        passwordTextfield.isSecureTextEntry = !isPasswordVisible
    }
    
}
