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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainView.layer.cornerRadius = 12
        mainView.layer.masksToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Calculate the center position
        let centerX = (self.view.frame.width - self.mainView.frame.width) / 2
        let centerY = (self.view.frame.height - self.mainView.frame.height) / 2
        
        // Animate the mainView to the center position
        UIView.animate(withDuration: 0.3, animations: {
            self.mainView.frame.origin = CGPoint(x: centerX, y: centerY)
        })
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainView.alpha = 0
        }, completion: { _ in
            NotificationCenter.default.post(name: NSNotification.Name("Unhide"), object: nil)
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainView.alpha = 0
        }, completion: { _ in
//            NotificationCenter.default.post(name: NSNotification.Name("Unhide"), object: nil)
            let loginVC = AppController.shared.Login
            
            let newNavController = UINavigationController(rootViewController: loginVC)
            
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = newNavController
//                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
            
            UserData.shared.isLoggedIn = false
            self.dismiss(animated: false, completion: nil)
        })
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
