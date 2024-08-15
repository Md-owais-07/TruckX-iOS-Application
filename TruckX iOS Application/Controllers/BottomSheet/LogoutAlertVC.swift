//
//  LogoutAlertVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit

class LogoutAlertVC: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblLogout: UILabel!
    @IBOutlet weak var lblLogoutDescription: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        customView.alpha = 0
        mainView.alpha = 0
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 12
        mainView.layer.masksToBounds = true
        
        setAttributedText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.customView.alpha = 0.4
            self.mainView.alpha = 1.0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainView.alpha = 0
        }, completion: { _ in
            let loginVC = AppController.shared.Login
            let newNavController = UINavigationController(rootViewController: loginVC)
            
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = newNavController
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
            
            UserData.shared.isLoggedIn = false
            self.dismiss(animated: false, completion: nil)
        })
    }
    
}

extension LogoutAlertVC {
    func setAttributedText() {
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .bold),
            .foregroundColor: #colorLiteral(red: 0.5333333611, green: 0.5333333611, blue: 0.5333333611, alpha: 1).withAlphaComponent(50)
        ]
        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .regular),
            .foregroundColor: #colorLiteral(red: 0.5333333611, green: 0.5333333611, blue: 0.5333333611, alpha: 1).withAlphaComponent(50)
        ]
        var attributeString = NSMutableAttributedString(
            string: "TrucX app ?",
            attributes: boldAttributes)
        var attributeString1 = NSMutableAttributedString(
            string: "Are you sure you want to log out of ",
            attributes: regularAttributes)
        attributeString1.append(attributeString)
        lblLogoutDescription.attributedText = attributeString1
    }
    
}
