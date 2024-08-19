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
        topView.layer.cornerRadius = 13
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        btnSign.addTarget(self, action: #selector(gotoSign), for: .touchUpInside)
        btnLogs.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnDocs.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(popToRootView), for: .touchUpInside)
        
        btnTripInspection.layer.cornerRadius = 10
        btnTripInspection.layer.borderWidth = 2
        btnTripInspection.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    @objc func gotoSign() {
        let signVC = AppController.shared.Sign
        self.navigationController?.pushViewController(signVC, animated: true)
    }

}
