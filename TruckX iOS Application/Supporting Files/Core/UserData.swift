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
    
    var isLoggedIn: Bool
    {
        get {
            return userDefault.value(forKey: "isLoggedIn") as? Bool ?? false
        }
        set(status) {
            return userDefault.set(status, forKey: "isLoggedIn")
        }
    }
    
    var currentAuthKey: String
    {
        get {
            return userDefault.string(forKey: "currentAuthKey") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "currentAuthKey")
        }
    }
    
    var firstName: String
    {
        get {
            return userDefault.string(forKey: "firstName") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "firstName")
        }
    }
    
    var lastName: String
    {
        get {
            return userDefault.string(forKey: "lastName") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "lastName")
        }
    }
    
    var emailAddress: String
    {
        get {
            return userDefault.string(forKey: "emailAddress") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "emailAddress")
        }
    }
    
    var userId: String
    {
        get {
            return userDefault.string(forKey: "userId") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "userId")
        }
    }
    var createdAt: String
    {
        get {
            return userDefault.string(forKey: "createdAt") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "createdAt")
        }
    }
}
