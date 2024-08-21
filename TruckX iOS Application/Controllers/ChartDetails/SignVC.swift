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
        
        btnLogs.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnDocs.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnDvir.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(popToRootView), for: .touchUpInside)
        
        self.enablePopGestureRecognizer()
    }

    @IBAction func agreeButtonAction(_ sender: Any) {
        
    }
}
