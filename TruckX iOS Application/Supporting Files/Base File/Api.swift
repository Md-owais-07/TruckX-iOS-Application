//
//  Api.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

final class Api {
    static let shared = Api()

    // MARK: - ONBOARDING SCREENS
    var authenticate: ApiModel {
        return ApiModel(method: .post, urlString: "integration/customer/token")
    }
    var storePushToken: ApiModel {
        return ApiModel(method: .post, urlString: "pushnotifications/register")
    }
    var categories: ApiModel {
        return ApiModel(method: .get, urlString: "categories")
    }
}
