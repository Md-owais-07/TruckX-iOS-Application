//
//  ApiModels.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class ApiModel {
    var method: HTTPMethod
    var url: URL
    var takingToken: Bool
    var contentType: ApiContentType

    init(method: HTTPMethod, urlString: String, takingToken: Bool = false, contentType: ApiContentType = .json) {
        self.method = method
        self.url = URL(string: urlString) ?? URL(string: "https://example.com")! // Fallback URL
        self.takingToken = takingToken
        self.contentType = contentType
    }
}
