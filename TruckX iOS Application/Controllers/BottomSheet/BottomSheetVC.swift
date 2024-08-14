//
//  BottomSheetVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 12/08/24.
//

import UIKit

class BottomSheetVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        
        startButton.layer.cornerRadius = 10
        startButton.layer.borderWidth = 4
        startButton.layer.borderColor = #colorLiteral(red: 0.09424795955, green: 0.3382889926, blue: 0.3569509983, alpha: 1)
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.frame.origin.y = self.view.frame.height - self.containerView.frame.height
        })
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.frame.origin.y = self.view.frame.height
        }, completion: { _ in
            NotificationCenter.default.post(name: NSNotification.Name("Unhide"), object: nil)
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        print("Start button tapped")
        self.dismiss(animated: false, completion: nil)
    }
    
}
