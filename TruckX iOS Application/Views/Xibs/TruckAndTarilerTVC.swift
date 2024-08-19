//
//  TruckAndTarilerTVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

class TruckAndTarilerTVC: UITableViewCell {
    @IBOutlet weak var btnUnassign: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        applyShadowF(to: contentView)
    }
    
}

extension UIView {
    func applyShadowF(to view: UIView) {
        // First Shadow
        let firstShadowLayer = CALayer()
        firstShadowLayer.shadowColor = UIColor.black.cgColor
        firstShadowLayer.shadowOpacity = 0.02
        firstShadowLayer.shadowOffset = CGSize(width: 0, height: 15)
        firstShadowLayer.shadowRadius = 68 / 2 // Blur is divided by 2 to calculate shadowRadius
        firstShadowLayer.shadowPath = UIBezierPath(rect: view.bounds).cgPath

        // Second Shadow
        let secondShadowLayer = CALayer()
        secondShadowLayer.shadowColor = UIColor.black.cgColor
        secondShadowLayer.shadowOpacity = 0.03
        secondShadowLayer.shadowOffset = CGSize(width: 0, height: 4)
        secondShadowLayer.shadowRadius = 16.9 / 2 // Blur is divided by 2 to calculate shadowRadius
        secondShadowLayer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        
        // Adding shadows to the view
        view.layer.insertSublayer(firstShadowLayer, at: 0)
        view.layer.insertSublayer(secondShadowLayer, at: 1)
    }
}
