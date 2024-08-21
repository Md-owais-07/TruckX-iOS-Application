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
        mainView.layer.masksToBounds = true
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
