//
//  ChartDetailsVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 17/08/24.
//

import UIKit

class LogsVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnLogs: UIButton!
    @IBOutlet weak var btnDocs: UIButton!
    @IBOutlet weak var btnDvir: UIButton!
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnOFF: UIButton!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var seperatorView: UIView!
    @IBOutlet weak var topSeperater: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topView.layer.cornerRadius = 13
        topView.layer.borderWidth = 1
        topView.layer.borderColor = UIColor.black.withAlphaComponent(0.4).cgColor
        
        btnOFF.layer.cornerRadius = 15
        
        btnBack.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        btnDocs.addTarget(self, action: #selector(gotoDocs), for: .touchUpInside)
        btnDvir.addTarget(self, action: #selector(gotoDvir), for: .touchUpInside)
        btnSign.addTarget(self, action: #selector(gotoSign), for: .touchUpInside)
        
        seperatorView.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
        topSeperater.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
        
    }
    
    
    

}


extension LogsVC {
    @objc func gotoDocs() {
        let docsVC = AppController.shared.Docs
        self.navigationController?.pushViewController(docsVC, animated: true)
    }
    @objc func gotoDvir() {
        let dvirVC = AppController.shared.Dvir
        self.navigationController?.pushViewController(dvirVC, animated: true)
    }
    @objc func gotoSign() {
        let signVC = AppController.shared.Sign
        self.navigationController?.pushViewController(signVC, animated: true)
    }
}
