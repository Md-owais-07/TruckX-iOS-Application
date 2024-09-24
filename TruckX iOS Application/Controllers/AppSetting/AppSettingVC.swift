//
//  AppSettingVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

class AppSettingVC: UIViewController {
    @IBOutlet weak var btnBAck: UIButton!
    @IBOutlet weak var imgCountry: UIImageView!
    @IBOutlet weak var btnToggle: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBAck.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        imgCountry.applyCircularCornerRadius()
        
        self.enablePopGestureRecognizer()
    }
    
    @IBAction func nightModeButtonAction(_ sender: Any) {
        if btnToggle.tag == 0
        {
            self.btnToggle.setImage(UIImage(named: "Toggle-On"), for: .normal)
            self.btnToggle.tag = 1
        }
        else
        {
            self.btnToggle.setImage(UIImage(named: "Toggle-Off"), for: .normal)
            self.btnToggle.tag = 0
        }
        
    }
}
