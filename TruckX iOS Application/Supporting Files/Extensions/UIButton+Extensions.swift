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
    func setFontColor(color: UIColor)
    {
        self.setTitleColor(color, for: .normal)
    }
    func setDisabledFontColor(color: UIColor)
    {
        self.setTitleColor(color, for: .disabled)
    }
    func setFont(font: UIFont)
    {
        self.titleLabel?.font = font
    }
    
    func applyTouchEffect(normalBackgroundColor: UIColor = UIColor(red: 0, green: 0.730076015, blue: 0.7659813166, alpha: 1), highlightedBackgroundColor: UIColor = UIColor(red: 0, green: 0.730076015, blue: 0.7659813166, alpha: 0.4), normalTitleColor: UIColor = .white, highlightedTitleColor: UIColor = .lightGray)
    {
        
        self.backgroundColor = normalBackgroundColor
        self.setTitleColor(normalTitleColor, for: .normal)
        
        self.addTarget(self, action: #selector(buttonTouchedDown), for: .touchDown)
        self.addTarget(self, action: #selector(buttonTouchedUp), for: .touchUpInside)
        self.addTarget(self, action: #selector(buttonTouchedUp), for: .touchDragExit)
    }
    
    @objc private func buttonTouchedDown(_ sender: UIButton)
    {
        sender.backgroundColor = sender.backgroundColor?.withAlphaComponent(0.4)
        sender.setTitleColor(.lightGray, for: .normal)
    }
    
    @objc private func buttonTouchedUp(_ sender: UIButton)
    {
        sender.backgroundColor = #colorLiteral(red: 0, green: 0.730076015, blue: 0.7659813166, alpha: 1)
        sender.setTitleColor(.white, for: .normal)
    }
}
