//
//  RegisterVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 23/08/24.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnRegister: DesignableButton!
    @IBOutlet weak var btnpasswordToggle: UIButton!
    @IBOutlet weak var imgCheckStatus: UIImageView!
    @IBOutlet weak var btnRadio: UIButton!
    
    var isPasswordVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupLabel(lblTerms)
        self.updateLabelHeight(lblTerms)
        
        self.imgCheckStatus.image = UIImage(named: "Btn-uncheck")
        btnRadio.addTarget(self, action: #selector(gereeBtnToggle), for: .touchUpInside)
        
        PopGestureRecognizerDelegate()
        textFieldDelegate()
        btnRegister.applyTouchEffect()
        
        self.setupLoader()
        self.HideKeyboardWhenTapAround()
        self.enablePopGestureRecognizer()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let firstName = fNameTextField.text, firstName != "" else {
            self.toastView(toastMessage: "Please enter your first name", type: "error")
            return
        }
        guard let lastName = lNameTextField.text,  lastName != "" else {
            self.toastView(toastMessage: "Please enter your last name", type: "error")
            return
        }
        guard let email = emailTextField.text,  email != "" else {
            self.toastView(toastMessage: "Please enter your email address", type: "error")
            return
        }
        guard self.checkMailIdFormat(string: emailTextField.text ?? "") else {
            self.toastView(toastMessage: "Please enter a valid email address.", type: "error")
            return
        }
        guard let password = passwordTextField.text,  password != "" else {
            self.toastView(toastMessage: "Please enter your password", type: "error")
            return
        }
        guard password.count >= 6 else {
            self.toastView(toastMessage: "Please enter atleast 6 or more characters.", type: "error")
            return
        }
        
        showLottieLoader()
        APIManager.shared.authService.createUser(fName: firstName, lName: lastName, email: email, password: password) { result in
            DispatchQueue.main.async {
                self.hideLottieLoader()
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        UserData.shared.isLoggedIn = true
                        UserData.shared.currentAuthKey = "\(response.data.id)"
                        UserData.shared.firstName = response.data.firstName.capitalized
                        UserData.shared.lastName = response.data.lastName.capitalized
                        UserData.shared.emailAddress = response.data.email
                        print("CREATE USER RESPONSE IS: ", response)
                        self.toastView(toastMessage: "\(response.message)", type: "success")
                        self.navigateToHome()
                    }
                    print("REGISTER SUCCESS!!")
                case .failure(let error):
                    self.handleAPIError(error)
                }
            }
        }
    }
    
    @IBAction func loginNavigationButton(_ sender: Any) {
        self.popToVC()
    }
    
    @IBAction func agreeButtonToggle(_ sender: Any) {
        print("User agree with terms & conditions...")
    }
    
    @IBAction func passwordHiddenToggle(_ sender: UIButton) {
        self.togglePasswordVisibility(
            for: passwordTextField,
            button: btnpasswordToggle,
            isPasswordVisible: &isPasswordVisible,
            visibleImageName: "eye",
            hiddenImageName: "eye.slash.fill")
    }
    
}


extension RegisterVC {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func PopGestureRecognizerDelegate() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fNameTextField {
            lNameTextField.becomeFirstResponder()
        } else if textField == lNameTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldDelegate()
    {
        fNameTextField.delegate = self
        lNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func handleAPIError(_ error: Error)
    {
        if let nsError = error as NSError? {
            if nsError.code == 401 {
                self.toastView(toastMessage: "Invalid email or password.", type: "error")
            } else if nsError.code == 404 {
                self.toastView(toastMessage: "Invalid email or password.", type: "error")
            } else if nsError.code == 409 {
                self.toastView(toastMessage: "User already exists.", type: "error")
            }
        }
        print("Error: \(error.localizedDescription)")
    }
    
    @objc func gereeBtnToggle()
    {
        self.toggleButtonSelection(
            btnRadio,
            imageView: imgCheckStatus,
            selectedImage: UIImage(named: "Btn-check")!,
            deselectedImage: UIImage(named: "Btn-uncheck")!)
    }
}
