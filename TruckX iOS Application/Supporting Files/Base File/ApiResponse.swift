//
//  ApiResponse.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class ApiResponse {
    var status: ApiStatus
    var code: ApiStatusCode
    var message: String
    var data: Any?

    init(status: ApiStatus, code: ApiStatusCode = .other, message: String = "Something went wrong, please try again!", data: Any? = nil) {
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
}
