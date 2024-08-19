//
//  CountryDropDownVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 16/08/24.
//

import UIKit

class CountryDropDownVC: UIViewController {
    @IBOutlet weak var lblHeaderText: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnSelectedToggle: UIButton!
    @IBOutlet weak var imageCountry: UIImageView!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnApply.layer.cornerRadius = 10
        btnApply.layer.borderWidth = 4
        btnApply.layer.borderColor = #colorLiteral(red: 0.1158032492, green: 0.3620201349, blue: 0.8701846004, alpha: 1)
        
        btnCancel.layer.cornerRadius = 10
        btnCancel.layer.borderWidth = 4
        btnCancel.layer.borderColor = #colorLiteral(red: 0.7384595275, green: 0.2374818921, blue: 0.2672286034, alpha: 1)
        
        mainView.clipsToBounds = true
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 16
        
        mainView.alpha = 0
        containerView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.1) {
            self.containerView.alpha = 0.5
            self.mainView.alpha = 1.0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func applyButtonAction(_ sender: Any) {
        self.dismiss()
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss()
    }

}
