//
//  SignInResponse.swift
//  TruckX iOS Application
//
//  Created by Owais on 24/08/24.
//

import Foundation

struct SignInResponse: Codable {
    let data: UserLoginModel
    let accessToken: String
}

struct UserLoginModel: Codable {
    let firstName: String?
    let lastName: String?
    let email: String
}
