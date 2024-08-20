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
        countryView.layer.cornerRadius = 12
        countryView.layer.borderWidth = 2
        countryView.layer.borderColor = UIColor.systemGray5.cgColor
        
        timeView.layer.cornerRadius = 12
        timeView.layer.borderWidth = 2
        timeView.layer.borderColor = UIColor.systemGray5.cgColor
        
        applyShadow(to: countryView)
        
        btnBack.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        
        circularView.setTotalTime(600)
        circularView.startTimer()
    }
    
    func applyShadow(to view: UIView) {
        view.layer.shadowColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 0.25).cgColor // #EDEDED with 25% opacity
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 12) // X: 0, Y: 12
        view.layer.shadowRadius = 12 // Blur: 12
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.masksToBounds = false
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
