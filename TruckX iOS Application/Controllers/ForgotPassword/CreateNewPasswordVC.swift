//
//  CreateNewPasswordVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 26/09/24.
//

import UIKit

class CreateNewPasswordVC: UIViewController {
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createAnimation(on: animationView, animationName: "CreatePassword", loopMode: .loop)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        disablePopGestureRecognizer()
    }
    
    @IBAction func verifyOtpButtonAction(_ sender: Any) {
        guard let password = newPasswordTextField.text, password != "" else {
            self.toastView(toastMessage: "Please Create your New Password.", type: "error")
            return
        }
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword != "" else {
            self.toastView(toastMessage: "Please Enter your Confirm Password.", type: "error")
            return
        }
        guard password.count >= 6 else {
            self.toastView(toastMessage: "Please enter atleast 6 or more characters.", type: "error")
            return
        }
        guard confirmPassword == password else {
            self.toastView(toastMessage: "Passwords do not match. Please ensure both passwords are identical.", type: "error")
            return
        }
        
        showLottieLoader()
        
        APIManager.shared.userService.createNewPassword(newPassword: password, confirmPassword: confirmPassword, userId: "\(UserData.shared.userIdOtp)") { response in
            DispatchQueue.main.async {
                self.hideLottieLoader()
                switch response {
                case .success(let passwordResponse):
                    self.toastView(toastMessage: "\(passwordResponse.message)", type: "success")
                    print("CONFORM PASSWORD RESPONSE: \(passwordResponse)")
                    self.navigationController?.popToRootViewController(animated: false)
//                    let vc = AppController.shared.Tabbar
//                    let navigationController = UINavigationController(rootViewController: vc)
//                    navigationController.setNavigationBarHidden(true, animated: true)
//                    
//                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                       let sceneDelegate = windowScene.delegate as? SceneDelegate {
//                        sceneDelegate.window?.rootViewController = navigationController
//                        sceneDelegate.window?.makeKeyAndVisible()
//                    }
                case .failure(let error):
                    print("Error", error.localizedDescription)
                }
            }
        }
    }
    

}
