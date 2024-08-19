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
        exemptionImage.layer.cornerRadius = exemptionImage.frame.size.width / 2
        
//        if let imgUrlString = image, let imgUrl = URL(string: imgUrlString)
//        {
//            // Start an asynchronous task to download the image
//            downloadImage(from: imgUrl) { (image) in
//                DispatchQueue.main.async
//                {
//                    self.exemptionImage.image = image
//                }
//            }
//        }
        
        lblExemptionTitile.text = titleText
        
        btnBack.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnSetup.layer.cornerRadius = 10
    }

}
