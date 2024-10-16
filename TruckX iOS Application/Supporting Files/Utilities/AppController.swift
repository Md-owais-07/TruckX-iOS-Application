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
    
    var Home: HomeVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "HomeVC_id") as? HomeVC ?? HomeVC()
    }
    var Logbook: LogbookVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LogbookVC_id") as? LogbookVC ?? LogbookVC()
    }
    var Messgege: MessgegesVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "MessgegesVC_id") as? MessgegesVC ?? MessgegesVC()
    }
    var More: MoreVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "MoreVC_id") as? MoreVC ?? MoreVC()
    }
    var Login: LoginVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LoginVC_id") as? LoginVC ?? LoginVC()
    }
    var Tabbar: TabBarVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "TabBarVC_id") as? TabBarVC ?? TabBarVC()
    }
    var Exemption: ExemptionVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "ExemptionVC_id") as? ExemptionVC ?? ExemptionVC()
    }
    var ExemptionDetails: ExemptionDetailsVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "ExemptionDetailsVC_id") as? ExemptionDetailsVC ?? ExemptionDetailsVC()
    }
    var BottomSheet: BottomSheetVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "BottomSheetVC_id") as? BottomSheetVC ?? BottomSheetVC()
    }
    var Notifications: NotificationVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "NotificationVC_id") as? NotificationVC ?? NotificationVC()
    }
    var NewChat: NewChatVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "NewChatVC_id") as? NewChatVC ?? NewChatVC()
    }
    var LogoutAlert: LogoutAlertVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LogoutAlertVC_id") as? LogoutAlertVC ?? LogoutAlertVC()
    }
    var CountryDropDown: CountryDropDownVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "CountryDropDownVC_id") as? CountryDropDownVC ?? CountryDropDownVC()
    }
    var HosInformation: HosInfoVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "HosInfoVC_id") as? HosInfoVC ?? HosInfoVC()
    }
    var Logs: LogsVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LogsVC_id") as? LogsVC ?? LogsVC()
    }
    var Docs: DocsVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "DocsVC_id") as? DocsVC ?? DocsVC()
    }
    var Dvir: DvirVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "DvirVC_id") as? DvirVC ?? DvirVC()
    }
    var Sign: SignVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "SignVC_id") as? SignVC ?? SignVC()
    }
    var TruckAndTrailer: TruckAndTarilerVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "TruckAndTarilerVC_id") as? TruckAndTarilerVC ?? TruckAndTarilerVC()
    }
    var CycleInformation: CycleInfoVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "CycleInfoVC_id") as? CycleInfoVC ?? CycleInfoVC()
    }
    var CarrierInformation: CarrierInfoVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "CarrierInfoVC_id") as? CarrierInfoVC ?? CarrierInfoVC()
    }
    var AppSettings: AppSettingVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "AppSettingVC_id") as? AppSettingVC ?? AppSettingVC()
    }
    var Register: RegisterVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "RegisterVC_id") as? RegisterVC ?? RegisterVC()
    }
    var Bottomvc: BottomVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "BottomVC_id") as? BottomVC ?? BottomVC()
    }
    var ChangeStatus: ChangeStatusVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "ChangeStatusVC_id") as? ChangeStatusVC ?? ChangeStatusVC()
    }
    var ForgotPassword: ForgotPasswordVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "ForgotPasswordVC_id") as? ForgotPasswordVC ?? ForgotPasswordVC()
    }
    var VerifyOtp: VerifyOtpVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "VerifyOtpVC_id") as? VerifyOtpVC ?? VerifyOtpVC()
    }
    var CreateNewPassword: CreateNewPasswordVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "CreateNewPasswordVC_id") as? CreateNewPasswordVC ?? CreateNewPasswordVC()
    }
    var LandingPage: LandingVC
    {
        AppStoryBoard.shared.main.instantiateViewController(withIdentifier: "LandingVC_id") as? LandingVC ?? LandingVC()
    }
}
