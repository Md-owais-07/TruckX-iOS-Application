//
//  DocsVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 17/08/24.
//

import UIKit

class DocsVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnLogs: UIButton!
    @IBOutlet weak var btnDocs: UIButton!
    @IBOutlet weak var btnDvir: UIButton!
    @IBOutlet weak var btnSign: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnDvir.addTarget(self, action: #selector(gotoDvir), for: .touchUpInside)
        btnSign.addTarget(self, action: #selector(gotoSign), for: .touchUpInside)
        btnLogs.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(popToRootView), for: .touchUpInside)
        
        self.enablePopGestureRecognizer()
    }
}

extension DocsVC {
    @objc func gotoDvir()
    {
        let dvirVC = AppController.shared.Dvir
        self.pushToVC(dvirVC)
    }
    
    @objc func gotoSign()
    {
        let signVC = AppController.shared.Sign
        self.pushToVC(signVC)
    }
}
