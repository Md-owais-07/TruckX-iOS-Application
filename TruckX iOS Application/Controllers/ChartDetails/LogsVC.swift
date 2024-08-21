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
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnDocs.addTarget(self, action: #selector(gotoDocs), for: .touchUpInside)
        btnDvir.addTarget(self, action: #selector(gotoDvir), for: .touchUpInside)
        btnSign.addTarget(self, action: #selector(gotoSign), for: .touchUpInside)
        seperatorViewColor()
        self.enablePopGestureRecognizer()
    }
}


extension LogsVC {
    @objc func gotoDocs() {
        let docsVC = AppController.shared.Docs
        self.pushToVC(docsVC)
    }
    @objc func gotoDvir() {
        let dvirVC = AppController.shared.Dvir
        self.pushToVC(dvirVC)
    }
    @objc func gotoSign() {
        let signVC = AppController.shared.Sign
        self.pushToVC(signVC)
    }
    func seperatorViewColor() {
        seperatorView.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
        topSeperater.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.3)
    }
}
