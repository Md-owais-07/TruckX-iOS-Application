//
//  NotificationVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit
import Lottie

class NotificationVC: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        createAnimations()
        self.enablePopGestureRecognizer()
    }
    
    func createAnimations() {
        let animationView = LottieAnimationView(name: "No-Notifications")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.frame = animatedView.bounds
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animatedView.addSubview(animationView)
        
        // Center the animationView inside animatedView using Auto Layout
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: animatedView.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: animatedView.centerYAnchor),
            animationView.widthAnchor.constraint(equalTo: animatedView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: animatedView.heightAnchor)
        ])
        
        animationView.play()
    }

}
