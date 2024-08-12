//
//  HomeVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var dView: UIView!
    @IBOutlet weak var onView: UIView!
    @IBOutlet weak var ofView: UIView!
    @IBOutlet weak var sbView: UIView!
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var yardView: UIView!
    @IBOutlet weak var hosView: UIView!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gradientView.applyGradient()
        
        hosView.layer.cornerRadius = 8
        
        countryView.layer.cornerRadius = 12
        countryView.layer.borderWidth = 2
        countryView.layer.borderColor = UIColor.systemGray5.cgColor
        
        topView.layer.cornerRadius = 12
        topView.layer.borderWidth = 2
        topView.layer.borderColor = UIColor.systemGray5.cgColor
        
        signView.layer.cornerRadius = 19
        signView.layer.borderWidth = 2
        signView.layer.borderColor = UIColor.systemGray6.cgColor
        
        dView.layer.cornerRadius = 12
        ofView.layer.cornerRadius = 12
        onView.layer.cornerRadius = 12
        sbView.layer.cornerRadius = 12
        personalView.layer.cornerRadius = 12
        yardView.layer.cornerRadius = 12
        
        bottomView.isHidden = true
        
    }
    
    

}
