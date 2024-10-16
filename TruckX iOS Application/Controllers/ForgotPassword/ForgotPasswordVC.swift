//
//  ForgotPasswordVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 26/09/24.
//

import UIKit
import UserNotifications

class ForgotPasswordVC: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        PopGestureRecognizerDelegate()
        NotificationManager.shared.requestNotificationPermission()
        NotificationManager.shared.configureNotificationDelegate(for: self)
        self.createAnimation(on: animationView, animationName: "ForgotPassword")
        self.enablePopGestureRecognizer()
    }

    @IBAction func sendOtpButtonAction(_ sender: Any) {
        guard let email = emailTextField.text,  email != "" else {
            self.toastView(toastMessage: "Please enter your email address.", type: "error")
            return
        }
        guard self.checkMailIdFormat(string: emailTextField.text ?? "") else {
            self.toastView(toastMessage: "Please enter a valid email address.", type: "error")
            return
        }
        showLottieLoader()
        APIManager.shared.userService.forgotPassword(email: email) { response in
            DispatchQueue.main.async {
                self.hideLottieLoader()
                switch response {
                case .success(let otpResponse):
                    self.toastView(toastMessage: "\(otpResponse.message)", type: "success")
                    UserData.shared.userIdOtp = "\(otpResponse.data.id)"
                    UserData.shared.userOtp = "\(otpResponse.data.otp)"
                    UserData.shared.emailID = "\(email)"
                    print("OTP MODEL RESPONSE WITH SUCCESS: \(otpResponse)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        NotificationManager.shared.scheduleOtpNotification(otp: "\(otpResponse.data.otp)")
                    }
                    let vc = AppController.shared.VerifyOtp
                    self.pushToVC(vc)
                case .failure(let otpError):
                    print("Failed to fetch OTP: \(otpError.localizedDescription)")
                }
            }
        }
    }
}


extension ForgotPasswordVC: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func PopGestureRecognizerDelegate() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
