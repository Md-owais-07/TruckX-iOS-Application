//
//  UserData.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class UserData {
    static let shared = UserData()
    private let userDefault = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return userDefault.value(forKey: "isLoggedIn") as? Bool ?? false
        }
        set(status) {
            return userDefault.set(status, forKey: "isLoggedIn")
        }
    }
}
