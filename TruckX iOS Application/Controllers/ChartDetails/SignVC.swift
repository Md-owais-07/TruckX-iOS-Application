//
//  SignVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 17/08/24.
//

import UIKit

class SignVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnLogs: UIButton!
    @IBOutlet weak var btnDocs: UIButton!
    @IBOutlet weak var btnDvir: UIButton!
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnNotReady: UIButton!
    @IBOutlet weak var btnAgree: UIButton!
    @IBOutlet weak var textView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topView.layer.cornerRadius = 13
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        btnLogs.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnDocs.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnDvir.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(popToRootView), for: .touchUpInside)
        
        btnAgree.layer.cornerRadius = 10
        
        btnNotReady.layer.cornerRadius = 10
        btnNotReady.layer.borderWidth = 2
        btnNotReady.layer.borderColor = #colorLiteral(red: 0, green: 0.3433497846, blue: 0.3613733053, alpha: 1)
        
        textView.layer.cornerRadius = 12
        textView.layer.borderWidth = 2
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1048220199)
    }

    @IBAction func agreeButtonAction(_ sender: Any) {
        
    }
}
