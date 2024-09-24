//
//  LottieLoaderManager.swift
//  TruckX iOS Application
//
//  Created by Owais on 22/09/24.
//

import UIKit
import Lottie

class LottieLoaderManager {
    static let shared = LottieLoaderManager()  // Singleton instance
    
    private let animationView = LottieAnimationView(name: "loader-animation")
    private var isAnimating = false
    private let overlayView = UIView()

    private init() {
        setupOverlayView()
        setupAnimation()
    }

    // Setup the overlay view (transparent background) to block interactions
    private func setupOverlayView() {
        overlayView.frame = UIScreen.main.bounds
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        overlayView.isUserInteractionEnabled = true
        overlayView.accessibilityLabel = "Loading"  // Accessibility support
    }

    // Configure the Lottie animation
    private func setupAnimation() {
        animationView.frame = CGRect(x: 0, y: 0, width: 160, height: 160)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.center = overlayView.center
        animationView.accessibilityLabel = "Loader Animation"
        animationView.isUserInteractionEnabled = false
        overlayView.addSubview(animationView)
    }

    // Show the loader animation in the given view
    func showLoader(in view: UIView) {
        guard !isAnimating else { return }  // Prevent showing multiple loaders
        isAnimating = true
        // Update frame in case of orientation change
        overlayView.frame = view.bounds
        animationView.center = overlayView.center
        
        view.addSubview(overlayView)
        animationView.play()
    }

    // Hide the loader animation
    func hideLoader() {
        guard isAnimating else { return }  // Only hide if loader is animating
        animationView.stop()
        overlayView.removeFromSuperview()
        isAnimating = false
    }
    
    func updateLayout(for view: UIView) {
        overlayView.frame = view.bounds
        animationView.center = overlayView.center
    }
}
