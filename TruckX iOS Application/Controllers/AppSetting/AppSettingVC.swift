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
    @IBOutlet weak var addTralerView: UIView!
    @IBOutlet weak var countryDropButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBAck.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        addTralerView.isHidden = true
        imgCountry.isHidden = true
        countryDropButton.isHidden = true
        
        imgCountry.applyCircularCornerRadius()
        
        if UserData.shared.isGuestUser {
            imgCountry.isHidden = true
            UserData.shared.isGuestUser = false
        } else if UserData.shared.isLoggedIn {
            addTralerView.isHidden = false
            imgCountry.isHidden = false
            countryDropButton.isHidden = false
        }
        
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
