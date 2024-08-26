//
//  UIButton+Extensions.swift
//  TruckX iOS Application
//
//  Created by Owais on 21/08/24.
//

import UIKit

class AppPrimaryButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        self.setCornerRadius(radius: 5)
        self.setBackgroundColor2(color: .black)
        self.setFontColor(color: .white)
        self.setFont(font: UIFont.systemFont(ofSize: 15, weight: .bold))
    }
}

@IBDesignable
class DesignableButton: UIButton {
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

extension UIButton {
    func setFontColor(color: UIColor) {
       self.setTitleColor(color, for: .normal)
    }
    func setDisabledFontColor(color: UIColor) {
       self.setTitleColor(color, for: .disabled)
    }
    func setFont(font: UIFont) {
       self.titleLabel?.font = font
    }
}
