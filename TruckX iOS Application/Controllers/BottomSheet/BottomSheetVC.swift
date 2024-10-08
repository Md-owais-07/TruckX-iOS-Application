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
    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        containerView.layer.masksToBounds = true
        customView.isHidden = true
        containerView.alpha = 1
        containerView.clipsToBounds = true
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve) {
            self.customView.isHidden = false
            self.containerView.alpha = 1.0
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismissView()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        dismissView()
    }
    
}
