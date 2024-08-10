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
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblHeight: NSLayoutConstraint!
    @IBOutlet weak var loginButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnToggele: UIButton!
    
    var originalButtonPositionY: CGFloat?
    var originalButtonBottomConstraintConstant: CGFloat?
    
    var isPasswordVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLabel()
        labelHeight()
        
        btnLogin.layer.cornerRadius = 10
        
        btnLogin.translatesAutoresizingMaskIntoConstraints = false
        btnLogin.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        originalButtonPositionY = btnLogin.frame.origin.y
        
        emailTextfield.delegate = self
        passwordTextfield.delegate = self
        self.HideKeyboardWhenTapAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Adding observers for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            passwordTextfield.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if originalButtonPositionY == nil {
            // Store the original position
            originalButtonPositionY = btnLogin.frame.origin.y
        }
        
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            UIView.animate(withDuration: 0.3, animations: {
                // Move the button up only if it's not already moved
                self.btnLogin.frame.origin.y = self.originalButtonPositionY! - (keyboardHeight - 50)
            })
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if let originalY = originalButtonPositionY {
            UIView.animate(withDuration: 0.3, animations: {
                // Reset the button's position to its original location
                self.btnLogin.frame.origin.y = originalY
            })
        }
    }
    
    @IBAction func loginBtnction(_ sender: Any) {
        print("loginBtnction")
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
