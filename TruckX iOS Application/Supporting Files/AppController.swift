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
    var ExemptionDetails: ExemptionDetailsVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "ExemptionDetailsVC_id") as? ExemptionDetailsVC ?? ExemptionDetailsVC()
    }
    var BottomSheet: BottomSheetVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "BottomSheetVC_id") as? BottomSheetVC ?? BottomSheetVC()
    }
    var Notifications: NotificationVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "NotificationVC_id") as? NotificationVC ?? NotificationVC()
    }
    var NewChat: NewChatVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "NewChatVC_id") as? NewChatVC ?? NewChatVC()
    }
    var LogoutAlert: LogoutAlertVC {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LogoutAlertVC_id") as? LogoutAlertVC ?? LogoutAlertVC()
    }
}
