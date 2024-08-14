//
//  Enumerations.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

enum AppAssets: String {
    case tabbar_home = "Vector (2)"
    case tabbar_logbook = "Group"
    case tabbar_messgae = "Group (1)"
    case tabbar_more = "Vector"
    case tabbar_shadow = "tabbar_shadow"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum ApiContentType: String {
    case json = "application/json"
    case xml = "application/xml"
}

enum ApiStatus {
    case success
    case error
}

enum ApiStatusCode: Int {
    case success = 200
    case unauthorized = 401
    case notFound = 404
    case other = 900
}
