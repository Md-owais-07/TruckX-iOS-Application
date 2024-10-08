//
//  CustomUiView.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
}

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
    func setCornerRadius(radius: CGFloat)
    {
        self.layer.cornerRadius = radius
    }
    
    func setBackgroundColor2(color: UIColor)
    {
        self.backgroundColor = color
    }
    
    func applyCircularCornerRadius()
    {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
    
    func setShadow(radius: CGFloat = 10, opacity: Float = 0.8, color: UIColor = UIColor.systemGray5, offset: CGSize = CGSize.zero, cornerRadius: CGFloat = 16)
    {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowColor = color.cgColor
    }
    
    func setBackgroundColor(color: UIColor)
    {
        self.backgroundColor = color
    }
    
    func applyShadowStyle(cornerRadius: CGFloat, shadowOpacity: Float, shadowRadius: CGFloat = 8.0, shadowOffset: CGSize = CGSize(width: 0, height: 12), shadowColor: UIColor)
    {
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
    
    func applyGradient()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 25/255.0, green: 86/255.0, blue: 91/255.0, alpha: 1).cgColor,
            UIColor(red: 52/255.0, green: 183/255.0, blue: 193/255.0, alpha: 1).cgColor
        ]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds

        if let existingGradient = layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            existingGradient.removeFromSuperlayer()
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateGradientFrame), name: UIDevice.orientationDidChangeNotification, object: nil)
    }

    @objc private func updateGradientFrame()
    {
        if let gradientLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            gradientLayer.frame = bounds
        }
    }
    
    func applyGradient2()
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1).cgColor, // rgba(255, 255, 255, 1)
            UIColor(red: 55/255.0, green: 146/255.0, blue: 118/255.0, alpha: 1).cgColor  // rgba(55, 146, 118, 1)
        ]
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func customizeSearchBar()
    {
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.withAlphaComponent(80).cgColor
    }
    
    func applyFinalStyle(cornerRadius: CGFloat, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil)
    {
        self.layer.cornerRadius = cornerRadius
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        if let borderColor = borderColor {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
