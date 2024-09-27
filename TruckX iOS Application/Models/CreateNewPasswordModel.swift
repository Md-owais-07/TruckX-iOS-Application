//
//  CreateNewPasswordModel.swift
//  TruckX iOS Application
//
//  Created by Owais on 27/09/24.
//

//import Foundation
//
//struct CreateNewPasswordModel: Codable {
//    let status: Int
//    let message: String
//    let data: ConfirmPasswordData
//}
//
//struct ConfirmPasswordData: Codable {
//    let otp: String
//    let otpExpiration: String
//    let id: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case otp, otpExpiration
//    }
//}


import Foundation

struct CreateNewPasswordModel: Codable {
    let message: String
    let data: ConfirmPasswordData
}

struct ConfirmPasswordData: Codable {
    let otp: String
    let id: String
    let otpExpiration: String
    
    enum CodingKeys: String, CodingKey {
        case otp
        case id = "_id"
        case otpExpiration
    }
}
