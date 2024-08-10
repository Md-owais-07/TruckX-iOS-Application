//
//  UiVCExtension.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import Foundation
import UIKit

extension UIViewController {
    func HideKeyboardWhenTapAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
