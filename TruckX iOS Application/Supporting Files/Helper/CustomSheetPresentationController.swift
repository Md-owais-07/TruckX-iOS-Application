//
//  CustomSheetPresentationController.swift
//  TruckX iOS Application
//
//  Created by Owais on 28/08/24.
//

import UIKit

class CustomPresentationController: UIPresentationController {
    private var dimmingView: UIView!
    private var preferredHeight: CGFloat
    
    // Initialize with preferredHeight
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, preferredHeight: CGFloat) {
        self.preferredHeight = preferredHeight
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        // Create the dimming view
        dimmingView = UIView()
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
        dimmingView.alpha = 0.0
        
        // Add a tap gesture recognizer to dismiss the view controller
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        dimmingView.addGestureRecognizer(tapGesture)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        return CGRect(x: 0, y: containerView.bounds.height - preferredHeight,
                      width: containerView.bounds.width, height: preferredHeight)
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        
        // Add dimming view
        dimmingView.frame = containerView.bounds
        containerView.addSubview(dimmingView)
        
        // Animate the dimming view
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        }, completion: nil)
        
        // Apply corner radius to the presented view
        presentedView?.layer.cornerRadius = 16
        presentedView?.layer.masksToBounds = true
    }
    
    override func dismissalTransitionWillBegin() {
        // Animate the dimming view out
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        }, completion: { _ in
            self.dimmingView.removeFromSuperview()
        })
    }
    
    @objc private func dimmingViewTapped() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
