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
    @IBOutlet weak var lblDriveLeftData: UILabel!
    @IBOutlet weak var lblCycleLeftData: UILabel!
    @IBOutlet weak var lblShiftLeftData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        circularView.setTotalTime(600)
        circularView.startTimer()
        applyShadow(to: countryView)
        
        hosValueSetUp()
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


extension HosInfoVC {
    func hosValueSetUp()
    {
        APIManager.shared.userService.getUserProfile { response in
            DispatchQueue.main.async {
                switch response {
                case.success(let profileData):
                    DispatchQueue.main.async {
                        self.lblDriveLeftData.text = "\(profileData.data.driveLeft):00"
                        self.lblShiftLeftData.text = "\(profileData.data.shiftLeft):00"
                        self.lblCycleLeftData.text = "\(profileData.data.cycleInHrs):00 (\(profileData.data.cycleInDays) days)"
                    }
                case.failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
}
