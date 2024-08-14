//
//  TerminalDataModel.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

struct TerminalDataModel: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

struct DataClass: Codable {
    let docs: [Doc]
    let totalDocs, limit, totalPages, page: Int
    let pagingCounter: Int
    let hasPrevPage, hasNextPage: Bool
    let prevPage: Int?
    let nextPage: Int?
}

struct Doc: Codable {
    let id, name, address, timeZone: String
    let assets: [String]
    let contact: String
    let drivers: [Driver]
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, address, timeZone, assets, contact, drivers, createdAt, updatedAt
        case v = "__v"
    }
}

struct Driver: Codable {
    let driver: DriverDetails
    let unitNumber: Int
    let truck: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case driver
        case unitNumber
        case truck
        case id = "_id"
    }
}

struct DriverDetails: Codable {
    let location: Location
    let cycle, reStart, breakTime, useFor: String
    let blockDriverEdits, disableELDVin, extend14hoursWithSplitSleeperRule, restrictPersonalConveyance: Bool
    let restrictYardMove: Bool
    let id, fullName, firstName, lastName, email, password: String
    let wallet: Int
    let profilePic: String
    let isVerified: Bool
    let terminal, dutyStatus, userType, status: String
    let createdAt, updatedAt: String
    let v: Int
    let otp: String?
    let otpExpiration: String?
    let truck: String

    enum CodingKeys: String, CodingKey {
        case location, cycle, reStart
        case breakTime = "break"
        case useFor, blockDriverEdits, disableELDVin, extend14hoursWithSplitSleeperRule
        case restrictPersonalConveyance, restrictYardMove
        case id = "_id"
        case fullName, firstName, lastName, email, password, wallet, profilePic, isVerified, terminal, dutyStatus, userType, status, createdAt, updatedAt
        case v = "__v"
        case otp, otpExpiration, truck
    }
}

struct Location: Codable {
    let type: String
    let coordinates: [Double]
}
