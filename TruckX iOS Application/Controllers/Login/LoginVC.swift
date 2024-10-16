//
//  ViewController.swift
//  TruckX iOS Application
//
//  Created by Owais on 09/08/24.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var btnToggele: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    var isPasswordVisible: Bool = false
    private let loaderView = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        
        bottomView.isHidden = true
        
        setUpNavigation()
        setupLoader()
        btnLogin.applyTouchEffect()

        self.enablePopGestureRecognizer()
        self.HideKeyboardWhenTapAround()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.enablePopGestureRecognizer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLandscapeLottieLoader()
    }
    
    @IBAction func loginBtnction(_ sender: Any) {
        
        guard let email = emailTextfield.text,  email != "" else {
            self.toastView(toastMessage: "Please enter your email address.", type: "error")
            return
        }
        
        guard self.checkMailIdFormat(string: emailTextfield.text ?? "") else {
            self.toastView(toastMessage: "Please enter a valid email address.", type: "error")
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
        
        showLottieLoader()
        APIManager.shared.authService.signIn(email: email, password: password) { result in
            DispatchQueue.main.async {
                self.hideLottieLoader()
                switch result {
                case .success(let response):
                        UserData.shared.isLoggedIn = true
                        UserData.shared.currentAuthKey = "\(response.accessToken)"
                        print("SIGN IN USER RESPONSE IS: ", response)
                        
                        APIManager.shared.userService.getUserProfile { responseProfile in
                            switch responseProfile {
                            case.success(let userProfile):
                                print("User Profile: \(userProfile)")
                                DispatchQueue.main.async {
                                    UserData.shared.firstName = response.data.firstName?.capitalized ?? ""
                                    UserData.shared.lastName = response.data.lastName?.capitalized ?? ""
                                    UserData.shared.emailAddress = response.data.email
                                    UserData.shared.userId = userProfile.data.id
                                    UserData.shared.createdAt = userProfile.data.createdAt
                                    self.toastView(toastMessage: "Login Success!!", type: "success")
                                    self.navigateToHome()
                                }
                            case.failure(let error):
                                print("Failed to fetch user profile: \(error.localizedDescription)")
                            }
                        }
                    print("Login Success!")
                case .failure(let error):
                    if let nsError = error as NSError? {
                        if nsError.code == 401 {
                            self.toastView(toastMessage: "Invalid email or password.", type: "error")
                        } else if nsError.code == 404 {
                            self.toastView(toastMessage: "Invalid email or password.", type: "error")
                        }
                    }
                    print("Error with: \(error.localizedDescription)")
                }
            }
        }
    }
    
    @IBAction func passwordButtonToggle(_ sender: Any) {
        self.togglePasswordVisibility(
            for: passwordTextfield,
            button: btnToggele,
            isPasswordVisible: &isPasswordVisible,
            visibleImageName: "eye",
            hiddenImageName: "eye.slash.fill")
    }
    
    @IBAction func registerNavigationButton(_ sender: Any) {
        let registerVC = AppController.shared.Register
        self.pushToVC(registerVC)
    }
    
    @IBAction func forgetPasswordButtonAction(_ sender: Any) {
        let vc = AppController.shared.ForgotPassword
        self.pushToVC(vc)
    }
    
    
}

extension LoginVC {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func setUpNavigation() {
        navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
    }
}
