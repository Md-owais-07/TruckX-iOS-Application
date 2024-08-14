//
//  CustomUiView.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class AppHeaderView: UIView {
   required init?(coder: NSCoder) {
      super.init(coder: coder)
       self.setShadow()
   }
}

class AppStatusBar: UIView {
   required init?(coder: NSCoder) {
      super.init(coder: coder)
       self.setBackgroundColor(color: UIColor.black)
   }
}

extension UIView {
    func setShadow(radius: CGFloat = 5, opacity: Float = 0.4, color: UIColor = UIColor.systemGray3, offset: CGSize = CGSize.zero, cornerRadius: CGFloat = 16)
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowColor = color.cgColor
    }
    
    func setBackgroundColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    func applyShadowStyle(cornerRadius: CGFloat, shadowOpacity: Float, shadowRadius: CGFloat = 8.0, shadowOffset: CGSize = CGSize(width: 0, height: 12), shadowColor: UIColor) {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = cornerRadius
        blurEffectView.clipsToBounds = true
        
        self.insertSubview(blurEffectView, at: 0)
    }
    
    func applyGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 25/255.0, green: 86/255.0, blue: 91/255.0, alpha: 1).cgColor,
            UIColor(red: 52/255.0, green: 183/255.0, blue: 193/255.0, alpha: 1).cgColor
        ]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func customizeSearchBar() {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.withAlphaComponent(80).cgColor
    }
}

