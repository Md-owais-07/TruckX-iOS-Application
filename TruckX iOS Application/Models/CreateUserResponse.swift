//
//  CreateUserResponse.swift
//  TruckX iOS Application
//
//  Created by Owais on 24/08/24.
//

import Foundation

struct CreateUserResponse: Codable {
    let message: String
    let status: Int
    let data: UserDataModel
}

struct UserDataModel: Codable {
    let isSubscription: Bool
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let wallet: Int
    let profilePic: String
    let isVerified: Bool
    let cargoType: String
    let cycle: String
    let cycleInHrs: Int
    let cycleInDays: Int
    let reStart: String
    let breakTime: String
    let shiftLeft: String
    let driveLeft: String
    let violations: Int
    let location: Location
    let dutyStatus: String
    let useFor: String
    let status: String
    let blockDriverEdits: Bool
    let disableELDVin: Bool
    let extend14hoursWithSplitSleeperRule: Bool
    let restrictPersonalConveyance: Bool
    let restrictYardMove: Bool
    let id: String
    let createdAt: String
    let updatedAt: String
    let v: Int
    let userType: String?  // Make this optional

    enum CodingKeys: String, CodingKey {
        case isSubscription
        case firstName
        case lastName
        case email
        case password
        case wallet
        case profilePic
        case isVerified
        case cargoType
        case cycle
        case cycleInHrs
        case cycleInDays
        case reStart
        case breakTime = "break"
        case shiftLeft
        case driveLeft
        case violations
        case location
        case dutyStatus
        case useFor
        case status
        case blockDriverEdits
        case disableELDVin
        case extend14hoursWithSplitSleeperRule
        case restrictPersonalConveyance
        case restrictYardMove
        case id = "_id"
        case createdAt
        case updatedAt
        case v = "__v"
        case userType  // This is now optional
    }
}

struct Location: Codable {
    let type: String
    let coordinates: [Double]
}
