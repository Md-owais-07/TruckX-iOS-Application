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
        
        imgCountry.layer.cornerRadius = imgCountry.frame.size.width / 2
        
        self.enablePopGestureRecognizer()
    }
    
    @IBAction func nightModeButtonAction(_ sender: Any) {
        if btnToggle.tag == 0
        {
            self.btnToggle.setImage(UIImage(named: "Property 1=off"), for: .normal)
            self.btnToggle.tag = 1
        }
        else
        {
            self.btnToggle.setImage(UIImage(named: "Property 1=off (1)"), for: .normal)
            self.btnToggle.tag = 0
        }
        
    }
    
    
}
