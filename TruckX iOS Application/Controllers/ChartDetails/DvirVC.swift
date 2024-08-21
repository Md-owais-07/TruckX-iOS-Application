//
//  DvirVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 17/08/24.
//

import UIKit

class DvirVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnLogs: UIButton!
    @IBOutlet weak var btnDocs: UIButton!
    @IBOutlet weak var btnDvir: UIButton!
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnTripInspection: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnSign.addTarget(self, action: #selector(gotoSign), for: .touchUpInside)
        btnLogs.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnDocs.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(popToRootView), for: .touchUpInside)
        
        self.enablePopGestureRecognizer()
    }
    
    @objc func gotoSign() {
        let signVC = AppController.shared.Sign
        self.navigationController?.pushViewController(signVC, animated: true)
    }

}
