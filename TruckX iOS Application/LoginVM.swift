//
//  LoginVM.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

extension LoginVC {
    func setupLabel() {
        let text = "by using xyz-product I agree to\nTerms & Conditions and Privacy Policy"
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], range: NSRange(location: 0, length: text.count))
        
        let rangeTerms = (text as NSString).range(of: "Terms & Conditions", options: .caseInsensitive)
        let rangePrivacy = (text as NSString).range(of: "Privacy Policy", options: .caseInsensitive)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 52/255, green: 183/255, blue: 193/255, alpha: 1), .font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: rangeTerms)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 52/255, green: 183/255, blue: 193/255, alpha: 1), .font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: rangePrivacy)
        
        lblTerms.attributedText = attributedString
    }
    
    func labelHeight() {
        let maxSize = CGSize(width: lblTerms.frame.width, height: CGFloat.greatestFiniteMagnitude)
        let textHeight = lblTerms.sizeThatFits(maxSize).height
        
        lblHeight.constant = textHeight
    }
}
