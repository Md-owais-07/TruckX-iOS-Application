//
//  ExemptionDetailsVCViewController.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit

class ExemptionDetailsVC: UIViewController {
    @IBOutlet weak var lblExemptionTitile: UILabel!
    @IBOutlet weak var exemptionImage: UIImageView!
    @IBOutlet weak var exemptionDesc: UILabel!
    @IBOutlet weak var exemptionLink: UILabel!
    @IBOutlet weak var btnSetup: UIButton!
    @IBOutlet weak var btnLearnmore: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var titleText: String?
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        exemptionImage.applyCircularCornerRadius()
        
        self.enablePopGestureRecognizer()
        
        lblExemptionTitile.text = titleText
        
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnSetup.layer.cornerRadius = 10
    }

}
