//
//  CreateUserResponse.swift
//  TruckX iOS Application
//
//  Created by Owais on 24/08/24.
//

import Foundation

struct CreateUserModel: Codable {
    let message: String
    let status: Int
    let data: CreateUserData
}

struct CreateUserData: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case password
        case id = "_id"
    }
}
