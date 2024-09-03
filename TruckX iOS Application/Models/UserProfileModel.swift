//
//  UserProfile.swift
//  TruckX iOS Application
//
//  Created by Owais on 26/08/24.
//

import Foundation

struct UserProfileModel: Codable {
    let message: String
    let data: UserProfileData
}

// MARK: - DataClass
struct UserProfileData: Codable {
    let location: Location
    let id: String
    let isSubscription: Bool
    let firstName: String?
    let lastName: String?
    let email: String
    let password: String
    let wallet: Int
    let profilePic: String
    let isVerified: Bool
    let cargoType, cycle: String
    let cycleInHrs, cycleInDays: Int
    let reStart, dataBreak, shiftLeft, driveLeft: String
    let violations: Int
    let dutyStatus, useFor, status: String
    let blockDriverEdits, disableELDVin, extend14HoursWithSplitSleeperRule, restrictPersonalConveyance: Bool
    let restrictYardMove: Bool
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case location
        case id = "_id"
        case isSubscription, firstName, lastName, email, password, wallet, profilePic, isVerified, cargoType, cycle, cycleInHrs, cycleInDays, reStart
        case dataBreak = "break"
        case shiftLeft, driveLeft, violations, dutyStatus, useFor, status, blockDriverEdits, disableELDVin
        case extend14HoursWithSplitSleeperRule = "extend14hoursWithSplitSleeperRule"
        case restrictPersonalConveyance, restrictYardMove, createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - Location
struct Location: Codable {
    let type: String
    let coordinates: [Int]
}
