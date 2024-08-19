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
        customView.alpha = 0.8
        mainView.alpha = 1.0
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 16
        mainView.layer.masksToBounds = true
        
        setAttributedText()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layoutIfNeeded()
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainView.alpha = 0
        }, completion: { _ in
            UserData.shared.isLoggedIn = false
            let loginVC = AppController.shared.Login
            let newNavController = UINavigationController(rootViewController: loginVC)
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let window = windowScene.windows.first {
                window.rootViewController = newNavController
//                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
            }
            
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
