//
//  ChangeStatusVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 30/08/24.
//

import UIKit

class ChangeStatusVC: UIViewController {
    @IBOutlet weak var viewOff: UIView!
    @IBOutlet weak var viewSb: UIView!
    @IBOutlet weak var viewOb: UIView!
    @IBOutlet weak var viewDriving: UIView!
    @IBOutlet weak var viewYard: UIView!
    @IBOutlet weak var viewPersonal: UIView!
    @IBOutlet weak var offView: UIView!
    @IBOutlet weak var sbView: UIView!
    @IBOutlet weak var onView: UIView!
    @IBOutlet weak var dView: UIView!
    @IBOutlet weak var yView: UIView!
    @IBOutlet weak var pView: UIView!
    @IBOutlet weak var lblOFF: UILabel!
    @IBOutlet weak var lblON: UILabel!
    @IBOutlet weak var lblSB: UILabel!
    @IBOutlet weak var lblD: UILabel!
    @IBOutlet weak var lblY: UILabel!
    @IBOutlet weak var lblP: UILabel!
    @IBOutlet weak var lblOffDuty: UILabel!
    @IBOutlet weak var lblSleeper: UILabel!
    @IBOutlet weak var lblOnDuty: UILabel!
    @IBOutlet weak var lblDriving: UILabel!
    @IBOutlet weak var lblYard: UILabel!
    @IBOutlet weak var lblPersonal: UILabel!
    @IBOutlet weak var btnApply: DesignableButton!
    @IBOutlet weak var btnCancel: DesignableButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var btnClose: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.layer.cornerRadius = 16
        
        offView.applyCircularCornerRadius()
        sbView.applyCircularCornerRadius()
        onView.applyCircularCornerRadius()
        dView.applyCircularCornerRadius()
        yView.applyCircularCornerRadius()
        pView.applyCircularCornerRadius()
        
        viewOff.applyFinalStyle(cornerRadius: 16)
        viewSb.applyFinalStyle(cornerRadius: 16)
        viewOb.applyFinalStyle(cornerRadius: 16)
        viewDriving.applyFinalStyle(cornerRadius: 16)
        viewYard.applyFinalStyle(cornerRadius: 16)
        viewPersonal.applyFinalStyle(cornerRadius: 16)
        
        btnClose.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    

}
