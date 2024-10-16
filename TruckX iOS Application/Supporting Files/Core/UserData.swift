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
    
    var isGuestUser: Bool
    {
        get {
            return userDefault.value(forKey: "isGuestUser") as? Bool ?? false
        }
        set(status) {
            userDefault.set(status, forKey: "isGuestUser")
        }
    }
    
    var isLoggedIn: Bool
    {
        get {
            return userDefault.value(forKey: "isLoggedIn") as? Bool ?? false
        }
        set(status) {
            userDefault.set(status, forKey: "isLoggedIn")
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
    
    var guestName: String
    {
        get {
            return userDefault.string(forKey: "guestName") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "guestName")
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
    
    var emailID: String
    {
        get {
            return userDefault.string(forKey: "emailID") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "emailID")
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
    
    var userIdOtp: String
    {
        get {
            return userDefault.string(forKey: "userId") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "userId")
        }
    }
    
    var userOtp: String
    {
        get {
            return userDefault.string(forKey: "userOtp") ?? ""
        }
        set(data) {
            userDefault.set(data, forKey: "userOtp")
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
