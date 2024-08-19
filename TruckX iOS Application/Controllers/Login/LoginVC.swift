//
//  ViewController.swift
//  TruckX iOS Application
//
//  Created by Owais on 09/08/24.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
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
    
    @IBAction func loginBtnction(_ sender: Any) {
        
        guard let email = emailTextfield.text,  email != "" else {
            self.toastView(toastMessage: "Please enter your email address.", type: "error")
            return
        }
        guard let password = passwordTextfield.text, password != "" else {
            self.toastView(toastMessage: "Please enter your Password.", type: "error")
            return
        }
        guard password.count >= 6 else {
            self.toastView(toastMessage: "Please enter atleast 6 or more characters.", type: "error")
            return
        }
        
        showLoader()
        APIManager.shared.authService.signIn(email: emailTextfield.text!, password: passwordTextfield.text!) { result in
            DispatchQueue.main.async {
                self.hideLoader()
                switch result {
                case .success(let accessToken):
                    self.toastView(toastMessage: "Login Success!!", type: "success")
                    UserData.shared.isLoggedIn = true
                    UserData.shared.currentAuthKey = accessToken
                    let tabBarController = AppController.shared.Tabbar
                    
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let window = windowScene.windows.first {
                        window.rootViewController = tabBarController
                        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
                        window.makeKeyAndVisible()
                    }
                    print("Login Success, with Access Token: \(accessToken)")
                case .failure(let error):
                    if let nsError = error as NSError?, nsError.code == 401 {
                        self.toastView(toastMessage: "Invalid username and password.", type: "error")
                    }
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

extension LoginVC {
    
    func setupLabel() {
        let text = "by using xyz-product I agree to\nTerms & Conditions and Privacy Policy"
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], range: NSRange(location: 0, length: text.count))
        
        let rangeTerms = (text as NSString).range(of: "Terms & Conditions", options: .caseInsensitive)
        let rangePrivacy = (text as NSString).range(of: "Privacy Policy", options: .caseInsensitive)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 52/255, green: 183/255, blue: 193/255, alpha: 1), .font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: rangeTerms)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 52/255, green: 183/255, blue: 193/255, alpha: 1), .font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: rangePrivacy)
        
        lblTerms.attributedText = attributedString
    }
    
    func labelHeight() {
        let maxSize = CGSize(width: lblTerms.frame.width, height: CGFloat.greatestFiniteMagnitude)
        let textHeight = lblTerms.sizeThatFits(maxSize).height
        
        lblHeight.constant = textHeight
    }
    
    @objc func agreeButtonTerms(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            self.imgCheckStatus.image = UIImage(named: "ri_checkbox-line (1)")
        } else {
            self.imgCheckStatus.image = UIImage(named: "ri_checkbox-line")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func setupLoader() {
        loaderView.frame = view.bounds
        loaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // Ensure it resizes with the main view
        view.addSubview(loaderView)
        loaderView.isHidden = true
    }
    
    func showLoader() {
        loaderView.startLoading()
    }
    
    func hideLoader() {
        loaderView.stopLoading()
    }
}
