//
//  OrientationManager.swift
//  TruckX iOS Application
//
//  Created by Owais on 30/08/24.
//

import UIKit

class OrientationManager {
    static let shared = OrientationManager()
    
    private init() {}
    
    func setOrientation(_ orientation: UIInterfaceOrientation) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        
        let orientationMask: UIInterfaceOrientationMask
        
        switch orientation {
        case .portrait:
            orientationMask = .portrait
        case .landscapeLeft:
            orientationMask = .landscapeLeft
        case .landscapeRight:
            orientationMask = .landscapeRight
        default:
            orientationMask = .all
        }
        
        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: orientationMask)) { error in
            print("Error requesting geometry update: \(error)")
        }
    }
    
    func forcePortrait() {
        setOrientation(.portrait)
    }
    
    func forceLandscape() {
        setOrientation(.landscapeRight)
    }
}
