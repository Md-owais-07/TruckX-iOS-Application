//
//  VerifyOtpVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 26/09/24.
//

import UIKit

class VerifyOtpVC: UIViewController {
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var otpTextFieldOne: UITextField!
    @IBOutlet weak var otpTextFieldTwo: UITextField!
    @IBOutlet weak var otpTextFieldThree: UITextField!
    @IBOutlet weak var otpTextFieldFour: UITextField!
    @IBOutlet weak var btnResendOtp: UIButton!
    @IBOutlet var otpView: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        otpTextFieldOne.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextFieldTwo.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextFieldThree.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextFieldFour.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        for view in otpView {
            view.layer.cornerRadius = 20
            view.layer.masksToBounds = true
        }
        
        NotificationManager.shared.requestNotificationPermission()
        NotificationManager.shared.configureNotificationDelegate(for: self)
        
        applyUnderlineToButton(btnResendOtp)
        self.createAnimation(on: animatedView, animationName: "EmailAnimations")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        otpTextFieldOne.becomeFirstResponder()
    }
    
    @objc func textDidChange(textField: UITextField) {
        guard let text = textField.text, text.count == 1 else { return }
        
        switch textField {
        case otpTextFieldOne:
            otpTextFieldTwo.becomeFirstResponder()
            
        case otpTextFieldTwo:
            otpTextFieldThree.becomeFirstResponder()
            
        case otpTextFieldThree:
            otpTextFieldFour.becomeFirstResponder()
            
        case otpTextFieldFour:
            otpTextFieldFour.resignFirstResponder()
            
        default:
            break
        }
    }
    
    @IBAction func verifyOtpButtonAction(_ sender: Any) {
        let otpCode = (otpTextFieldOne.text ?? "") +
        (otpTextFieldTwo.text ?? "") +
        (otpTextFieldThree.text ?? "") +
        (otpTextFieldFour.text ?? "")
        
        guard otpCode.count == 4 else {
            self.toastView(toastMessage: "Please enter a valid 4-digit OTP.", type: "error")
            return
        }
        
        guard otpCode == UserData.shared.userOtp else {
            self.toastView(toastMessage: "Invalid OTP. Please try again.", type: "error")
            return
        }
        
        showLottieLoader()
        
        APIManager.shared.userService.verifyOtp(otp: otpCode, userId: "\(UserData.shared.userIdOtp)") { response in
            DispatchQueue.main.async {
                self.hideLottieLoader()
                
                switch response {
                case .success(let otpResponse):
                    self.toastView(toastMessage: otpResponse.message, type: "success")
                    print("OTP RESPONSE: \(otpResponse)")
                    let vc = AppController.shared.CreateNewPassword
                    self.pushToVC(vc)
                    
                case .failure(let error):
                    print("OTP verification failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    @IBAction func resendOTPButtonAction(_ sender: Any) {
        let email = UserData.shared.emailID
        showLottieLoader()
        APIManager.shared.userService.forgotPassword(email: email) { response in
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.5) {
                self.hideLottieLoader()
                switch response {
                case .success(let otpResponse):
                    self.toastView(toastMessage: "\(otpResponse.message)", type: "success")
                    UserData.shared.userIdOtp = "\(otpResponse.data.id)"
                    UserData.shared.userOtp = "\(otpResponse.data.otp)"
                    print("OTP MODEL RESPONSE WITH SUCCESS: \(otpResponse)")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        NotificationManager.shared.scheduleOtpNotification(otp: "\(otpResponse.data.otp)")
                    }
                case .failure(let otpError):
                    print("Failed to fetch OTP: \(otpError.localizedDescription)")
                }
            }
        }
    }
    
    private func applyUnderlineToButton(_ button: UIButton) {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .underlineColor: #colorLiteral(red: 0, green: 0.730076015, blue: 0.7659813166, alpha: 1)
        ]
        
        let attributedTitle = NSAttributedString(string: button.title(for: .normal) ?? "",
                                                 attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
    }
    
}



extension VerifyOtpVC: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
