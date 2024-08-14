//
//  APIManager.swift
//  TruckX iOS Application
//
//  Created by Owais on 12/08/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    let authService: AuthService
    let terminalService: TerminalService
    let exemptionService: ExemptionService
    
    private init() {
        authService = AuthService()
        terminalService = TerminalService()
        exemptionService = ExemptionService()
    }
    
}


