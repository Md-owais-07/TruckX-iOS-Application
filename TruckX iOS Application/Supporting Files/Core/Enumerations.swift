//
//  Enumerations.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

enum AppAssets: String {
    case tabbar_home = "Home-Unselected"
    case tabbar_home_fill = "Home-Selected"
    case tabbar_logbook = "Book-Unselected"
    case tabbar_logbook_fill = "Book-Selected"
    case tabbar_messgae = "Message-Unselected"
    case tabbar_messgae_fill = "Message-Selected"
    case tabbar_more = "More-Unselected"
    case tabbar_more_fill = "More-Selected"
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
