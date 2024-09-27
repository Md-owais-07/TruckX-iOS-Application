//
//  VerifyOtpResponseModel.swift
//  TruckX iOS Application
//
//  Created by Owais on 27/09/24.
//

import Foundation

struct VerifyOtpResponseModel: Codable {
    let status: Int
    let message: String
    let data: OtpData
}

struct OtpData: Codable {
    let userId: String
    let otp: String
    
//    enum CodingKeys: String, CodingKey {
//        case userId = "userId"
//        case otp
//    }
}
