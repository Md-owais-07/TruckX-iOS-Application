//
//  AppController.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class AppStoryBoard {
    static let shared = AppStoryBoard()
    var main:UIStoryboard {
        UIStoryboard(name: "Main", bundle: nil)
    }
}

class AppController {
    static let shared = AppController()

    var Home: HomeVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "HomeVC_id") as? HomeVC ?? HomeVC()
    }
    var Logbook: LogbookVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LogbookVC_id") as? LogbookVC ?? LogbookVC()
    }
    var Messgege: MessgegesVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "MessgegesVC_id") as? MessgegesVC ?? MessgegesVC()
    }
    var More: MoreVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "MoreVC_id") as? MoreVC ?? MoreVC()
    }
    var Login: LoginVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LoginVC_id") as? LoginVC ?? LoginVC()
    }
    var Tabbar: TabBarVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "TabBarVC_id") as? TabBarVC ?? TabBarVC()
    }
    var Exemption: ExemptionVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "ExemptionVC_id") as? ExemptionVC ?? ExemptionVC()
    }
}

