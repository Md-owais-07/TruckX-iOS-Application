//
//  NotificationVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit

class NotificationVC: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        self.enablePopGestureRecognizer()
    }

}
