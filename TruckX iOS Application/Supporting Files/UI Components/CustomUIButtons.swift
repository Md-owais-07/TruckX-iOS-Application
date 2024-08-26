//
//  CustomUIButtons.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

class SetButtonUnderline: UIButton {
    let textAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 15, weight: .semibold),
        .foregroundColor: UIColor(red: 189/255.0, green: 61/255.0, blue: 68/255.0, alpha: 1),
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]

    override func awakeFromNib() {
       super.awakeFromNib()
       let attributeString = NSMutableAttributedString(
          string: self.titleLabel?.text ?? "",
          attributes: textAttributes)
       self.setAttributedTitle(attributeString, for: .normal)
    }

    func setCustomText(text: String) {
       let attributeString = NSMutableAttributedString(
          string: text,
          attributes: textAttributes)
       self.setAttributedTitle(attributeString, for: .normal)
    }
}
