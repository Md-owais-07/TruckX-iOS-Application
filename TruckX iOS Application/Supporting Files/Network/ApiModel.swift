//
//  ApiModels.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class ApiModel {
    var method: HTTPMethod
    var url: String
    var contentType: ApiContentType

    init(method: HTTPMethod, url: String, contentType: ApiContentType = .json) {
        self.method = method
        self.url = url
        self.contentType = contentType
    }
}
