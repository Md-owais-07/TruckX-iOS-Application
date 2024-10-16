//
//  UiVCExtension.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit
import Lottie

extension UIViewController: UITextFieldDelegate, UIGestureRecognizerDelegate {
    private var loaderView: LoaderView
    {
        return LoaderView.shared
    }
    
    func setupLoader()
    {
        loaderView.frame = view.bounds
        loaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(loaderView)
        loaderView.isHidden = true
    }
    
    func showLoader()
    {
        loaderView.startLoading()
    }
    
    func hideLoader()
    {
        loaderView.stopLoading()
    }
    
    func showLottieLoader()
    {
        LottieLoaderManager.shared.showLoader(in: self.view)
    }
    
    func hideLottieLoader()
    {
        LottieLoaderManager.shared.hideLoader()
    }
    
    func setLandscapeLottieLoader()
    {
        LottieLoaderManager.shared.updateLayout(for: self.view)
    }
    
    @objc func reloadView()
    {
        UIView.animate(withDuration: 1.0) {
            self.showLoader()
            self.view.alpha = 0.9
        } completion: { [self] _ in
            self.hideLoader()
            self.view.alpha = 1.0
            self.toastView(toastMessage: "Reload Success", type: "success")
        }
    }
    
    func HideKeyboardWhenTapAround()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func enablePopGestureRecognizer()
    {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func disablePopGestureRecognizer()
    {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func pushToVC<T: UIViewController>(_ viewController: T, animated: Bool = true)
    {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pushToVCWithHideTabBar<T: UIViewController>(_ viewController: T, animated: Bool = true, hidesBottomBar: Bool = true)
    {
        viewController.hidesBottomBarWhenPushed = hidesBottomBar
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    @objc func popToVC()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func popToRootView()
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func dismissKeyboard()
    {
        self.view.endEditing(true)
    }
    
    func dimmingViewTapped2()
    {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    func navigateToHome()
    {
        let tabBarController = AppController.shared.Tabbar
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = tabBarController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil)
            window.makeKeyAndVisible()
        }
    }
    
    @objc func dismissView() 
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame.origin.y = self.view.frame.size.height
        }, completion: { _ in
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func togglePasswordVisibility(for textField: UITextField, button: UIButton, isPasswordVisible: inout Bool, visibleImageName: String, hiddenImageName: String)
    {
        isPasswordVisible.toggle()
        let imageName = isPasswordVisible ? visibleImageName : hiddenImageName
        button.setImage(UIImage(systemName: imageName), for: .normal)
        textField.isSecureTextEntry = !isPasswordVisible
    }
    
    func checkMailIdFormat(string: String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: string)
    }
    
    func toggleButtonSelection(_ button: UIButton, imageView: UIImageView, selectedImage: UIImage, deselectedImage: UIImage)
    {
        button.isSelected.toggle()
        imageView.image = button.isSelected ? selectedImage : deselectedImage
    }
    
    func applyShadow(to view: UIView)
    {
        view.layer.shadowColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 12)
        view.layer.shadowRadius = 12 // Blur: 12
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.masksToBounds = false
    }
    
    func dismiss(completion:(()->())? = nil)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 0
            self.view.alpha = 0
            self.view.layoutIfNeeded()
        }) { (complete) in
            if complete {
                self.dismiss(animated: false) {
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
    
    func styleView(_ view: UIView, cornerRadius: CGFloat, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil)
    {
        view.layer.cornerRadius = cornerRadius
        if let borderWidth = borderWidth {
            view.layer.borderWidth = borderWidth
        }
        if let borderColor = borderColor {
            view.layer.borderColor = borderColor.cgColor
        }
    }
    
    func setupLabel(_ label: UILabel)
    {
        let text = "by using xyz-product I agree to\nTerms & Conditions and Privacy Policy"
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], range: NSRange(location: 0, length: text.count))
        
        let rangeTerms = (text as NSString).range(of: "Terms & Conditions", options: .caseInsensitive)
        let rangePrivacy = (text as NSString).range(of: "Privacy Policy", options: .caseInsensitive)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 52/255, green: 183/255, blue: 193/255, alpha: 1), .font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: rangeTerms)
        
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 52/255, green: 183/255, blue: 193/255, alpha: 1), .font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: rangePrivacy)
        
        label.attributedText = attributedString
    }
    
    func updateLabelHeight(_ label: UILabel)
    {
        let maxSize = CGSize(width: label.frame.width, height: CGFloat.greatestFiniteMagnitude)
        let textHeight = label.sizeThatFits(maxSize).height
        
        // Assuming you have a height constraint set up for this label
        if let heightConstraint = label.constraints.first(where: { $0.firstAttribute == .height }) {
            heightConstraint.constant = textHeight
        } else {
            // Add a height constraint if none exists
            let heightConstraint = label.heightAnchor.constraint(equalToConstant: textHeight)
            heightConstraint.isActive = true
        }
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
    {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    func createAnimation(on view: UIView, animationName: String, loopMode: LottieLoopMode = .playOnce) {
        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.frame = view.bounds
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        // Center the animationView inside the passed view using Auto Layout
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        animationView.play()
    }
    
    func toastView(toastMessage: String, visibleDuration: TimeInterval = 3,type: String)
    {
        DispatchQueue.main.async {
            let status = Network.isAvailable()
            let message = !status ? "No Internet Connection" : toastMessage
            
            let contentSize = message.boundingRect(with: CGSize(width: (self.view.frame.width * 0.85), height: 100), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)], context: nil)
            
            let width: CGFloat = self.view.frame.size.width ///- 40
            let xPosition: CGFloat = ((self.view.frame.width - width) / 2)
            let contentWidth = message.size(withAttributes:[.font: UIFont.systemFont(ofSize: 13)]).width
            
            var contentLineCount = 0
            let widthText = width-54
            
            if widthText <= contentWidth
            {
                let line = Int(contentWidth/widthText)
                if (CGFloat(line) * widthText) < contentWidth
                {
                    contentLineCount = Int(line+2)
                }
                else
                {
                    contentLineCount = Int(line+1)
                }
            }
            else
            {
                contentLineCount = 1
            }
            let contentHeight = (Int(message.size(withAttributes:[.font: UIFont.systemFont(ofSize: 13)]).height) * contentLineCount)+20
            let height: CGFloat = CGFloat(contentHeight)
            ///let yPosition: CGFloat = ((self.view.frame.height - height) - 200)
            let toastTextView = ToastView(frame: CGRect(x: 0, y: 0, width: width, height: 100))
            let windows = UIApplication.shared.windows.last
            windows?.addSubview(toastTextView)
            toastTextView.statusCheck(status: type, message: message,widthis:(self.view.frame.size.width - 40))
            UIView.animate(withDuration: 0.3, animations: {
                toastTextView.alpha = 1
            }, completion: nil)
            Timer.scheduledTimer(withTimeInterval: visibleDuration, repeats: false, block: { (timer) in
                timer.invalidate()
                UIView.animate(withDuration: 0.3, animations: {
                    toastTextView.alpha = 0
                }, completion: { (completed) in
                    if completed {
                        toastTextView.removeFromSuperview()
                    }
                })
            })
        }
    }
}
