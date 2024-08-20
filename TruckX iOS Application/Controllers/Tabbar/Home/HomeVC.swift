//
//  HomeVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var yardView: UIView!
    @IBOutlet weak var hosView: UIView!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var btnHosInfo: UIButton!
    @IBOutlet weak var btnD: UIButton!
    @IBOutlet weak var btnOn: UIButton!
    @IBOutlet weak var btnOF: UIButton!
    @IBOutlet weak var btnSB: UIButton!
    
    var buttonStyles: [UIButton: (backgroundColor: (default: UIColor, selected: UIColor), textColor: (default: UIColor, selected: UIColor))] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnNotification.addTarget(self, action: #selector(popToNotificationVC), for: .touchUpInside)
        
        gradientView.applyGradient()
        
        hosView.layer.cornerRadius = 8
        
        countryView.layer.cornerRadius = 12
        countryView.layer.borderWidth = 2
        countryView.layer.borderColor = UIColor.systemGray5.cgColor
        
        topView.layer.cornerRadius = 12
        topView.layer.borderWidth = 2
        topView.layer.borderColor = UIColor.systemGray5.cgColor
        
        signView.layer.cornerRadius = 19
        signView.layer.borderWidth = 2
        signView.layer.borderColor = UIColor.systemGray5.withAlphaComponent(0.8).cgColor
        
        btnD.layer.cornerRadius = 12
        btnOn.layer.cornerRadius = 12
        btnOF.layer.cornerRadius = 12
        btnSB.layer.cornerRadius = 12
        personalView.layer.cornerRadius = 12
        yardView.layer.cornerRadius = 12
        
        bottomView.isHidden = true
        
        setupButtonStyles()
        updateAllButtonAppearances()
    }
    
    @IBAction func toggleButton(_ sender: UIButton) {
        deselectAllButtons()
        sender.isSelected = true
        updateButtonAppearance(sender)
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
            btnOF: (
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
        for button in [btnD, btnOn, btnOF, btnSB] {
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
        for button in [btnD, btnOn, btnOF, btnSB] {
            updateButtonAppearance(button!)
        }
    }
    
    @IBAction func dropDownButtonAction(_ sender: Any) {
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
    
    @IBAction func hosInfoButtonAction(_ sender: Any) {
        let hosInfoVC = AppController.shared.HosInformation
        self.navigationController?.pushViewController(hosInfoVC, animated: true)
    }
    
    @IBAction func chartButtonAction(_ sender: Any) {
        let chartDetailsVC = AppController.shared.Logs
        chartDetailsVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chartDetailsVC, animated: true)
    }
    
    @objc func popToNotificationVC() {
        let navigationVC = AppController.shared.Notifications
        navigationVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(navigationVC, animated: true)
    }
    
}
