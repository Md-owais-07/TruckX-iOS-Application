//
//  ForgotOtpDataModel.swift
//  TruckX iOS Application
//
//  Created by Owais on 26/09/24.
//

import Foundation

struct ForgotOtpDataModel: Codable {
    let message: String
    let data: ForgotOtpData
}

struct ForgotOtpData: Codable {
    let otp: String
    let otpExpiration: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case otp, otpExpiration
    }
}
