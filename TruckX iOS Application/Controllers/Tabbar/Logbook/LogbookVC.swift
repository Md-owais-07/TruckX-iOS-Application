//
//  LogbookVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class LogbookVC: UIViewController {
    @IBOutlet weak var btnNotifications: UIButton!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var btnD: DesignableButton!
    @IBOutlet weak var btnOn: DesignableButton!
    @IBOutlet weak var btnOf: DesignableButton!
    @IBOutlet weak var btnSB: DesignableButton!
    @IBOutlet weak var reusableView: ReusableGraphView!
    @IBOutlet weak var lblUserName: UILabel!
    
    var buttonStyles: [UIButton: (backgroundColor: (default: UIColor, selected: UIColor), textColor: (default: UIColor, selected: UIColor))] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNotifications.addTarget(self, action: #selector(pushToVC), for: .touchUpInside)
        btnRefresh.addTarget(self, action: #selector(reloadView), for: .touchUpInside)
        
        lblUserName.text = UserData.shared.isLoggedIn ? "\(UserData.shared.firstName) \(UserData.shared.lastName)" : "No Name Found"
        
        reusableView.viewController = self
        
        gradientView.applyGradient()
        updateAllButtonAppearances()
        setupButtonStyles()
        setupLoader()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        disablePopGestureRecognizer()
    }
    
    @objc func ddd() {
        let chartDetailsVC = AppController.shared.Logs
        self.pushToVCWithHideTabBar(chartDetailsVC)
    }
    
    @IBAction func dropDpwnButtonAction(_ sender: Any) {
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
    
    @IBAction func hosButtonAction(_ sender: Any) {
        let hosInfoVC = AppController.shared.HosInformation
        self.pushToVC(hosInfoVC)
    }
    
    @IBAction func btnToggle(_ sender: UIButton) {
        deselectAllButtons()
        sender.isSelected = true
        updateButtonAppearance(sender)
    }
}

extension LogbookVC {
    @objc func pushToVC() {
        let VC = AppController.shared.Notifications
        self.pushToVCWithHideTabBar(VC)
    }
    
    private func setupButtonStyles() {
        buttonStyles = [
            btnD: (
                backgroundColor: (default: #colorLiteral(red: 0.8278301358, green: 0.948792398, blue: 0.9425254464, alpha: 1),
                                  selected: #colorLiteral(red: 0.1362870038, green: 0.7520977855, blue: 0.7163547873, alpha: 1)),
                textColor: (default: #colorLiteral(red: 0.4983439445, green: 0.5182951093, blue: 0.560801208, alpha: 1),
                            selected: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            ),
            btnOn: (
                backgroundColor: (default: #colorLiteral(red: 0.846791327, green: 0.911867559, blue: 0.8935448527, alpha: 1),
                                  selected: #colorLiteral(red: 0.2152214944, green: 0.5723008513, blue: 0.4602287412, alpha: 1)),
                textColor: (default: #colorLiteral(red: 0.4983439445, green: 0.5182951093, blue: 0.560801208, alpha: 1),
                            selected: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            ),
            btnOf: (
                backgroundColor: (default: #colorLiteral(red: 0.9458915591, green: 0.8474674225, blue: 0.8622860312, alpha: 1),
                                  selected: #colorLiteral(red: 0.734123826, green: 0.2380811572, blue: 0.2674728036, alpha: 1)),
                textColor: (default: #colorLiteral(red: 0.4983439445, green: 0.5182951093, blue: 0.560801208, alpha: 1),
                            selected: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            ),
            btnSB: (
                backgroundColor: (default: #colorLiteral(red: 0.8545162082, green: 0.9601272941, blue: 1, alpha: 1),
                                  selected: #colorLiteral(red: 0.2514599562, green: 0.8111010194, blue: 0.9997429252, alpha: 1)),
                textColor: (default: #colorLiteral(red: 0.4983439445, green: 0.5182951093, blue: 0.560801208, alpha: 1),
                            selected: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            )
        ]
    }
    
    private func deselectAllButtons() {
        for button in [btnD, btnOn, btnOf, btnSB] {
            button?.isSelected = false
            updateButtonAppearance(button!)
        }
    }
    
    private func updateButtonAppearance(_ button: UIButton) {
        guard let styles = buttonStyles[button] else { return }
        button.backgroundColor = button.isSelected ? styles.backgroundColor.selected : styles.backgroundColor.default
        button.setTitleColor(button.isSelected ? styles.textColor.selected : styles.textColor.default, for: .normal)
    }
    
    private func updateAllButtonAppearances() {
        for button in [btnD, btnOn, btnOf, btnSB] {
            updateButtonAppearance(button!)
        }
    }
}
