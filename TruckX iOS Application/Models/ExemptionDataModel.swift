//
//  ExemptionDataModel.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import Foundation

struct ExemptionDataModel: Codable {
    let message: String
    let status: Int
    let data: ExemptionData
}

struct ExemptionData: Codable {
    let docs: [Exemption]
    let totalDocs: Int
    let limit: Int
    let totalPages: Int
    let page: Int
    let pagingCounter: Int
    let hasPrevPage: Bool
    let hasNextPage: Bool
    let prevPage: Int?
    let nextPage: Int?
}

struct Exemption: Codable {
    let id: String
    let image: String?
    let title: String
    let description: String
    let milesFromLocationThenOffDuty: Int
    let exemptionFromLast5Day: Bool
    let createdAt: String
    let updatedAt: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case image
        case title
        case description
        case milesFromLocationThenOffDuty
        case exemptionFromLast5Day
        case createdAt
        case updatedAt
        case v = "__v"
    }
}
