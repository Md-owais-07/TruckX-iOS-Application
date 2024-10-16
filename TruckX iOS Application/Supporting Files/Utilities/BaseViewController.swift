//
//  BaseViewController.swift
//  TruckX iOS Application
//
//  Created by Owais on 17/10/24.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewForUser()
    }

    func configureViewForUser() {
        if UserData.shared.isGuestUser {
            handleGuestUserUI()
        } else if UserData.shared.isLoggedIn {
            handleLoggedInUserUI()
        }
    }

    func handleGuestUserUI() {
        // Implement guest-specific UI changes, e.g. hide buttons, disable features
    }

    func handleLoggedInUserUI() {
        // Implement logged-in user-specific UI changes
    }
}
