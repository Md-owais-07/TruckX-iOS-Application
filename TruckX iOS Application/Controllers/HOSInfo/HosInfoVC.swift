//
//  HosInfoVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 16/08/24.
//

import UIKit

class HosInfoVC: UIViewController {
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var reusableView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var circularView: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        circularView.setTotalTime(600)
        circularView.startTimer()
        applyShadow(to: countryView)
        
        self.enablePopGestureRecognizer()
    }

    @IBAction func countryDropDownButtonAction(_ sender: Any) {
        let dropDownVC = AppController.shared.CountryDropDown
        dropDownVC.modalPresentationStyle = .overCurrentContext
        dropDownVC.modalTransitionStyle = .crossDissolve
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController {
            rootVC.present(dropDownVC, animated: false, completion: nil)
        } else {
            print("Error: No active window found.")
        }
    }
}
