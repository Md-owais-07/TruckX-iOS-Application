//
//  UiVCExtension.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

extension UIViewController {
    func HideKeyboardWhenTapAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc func backToView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    func toastView(toastMessage: String, visibleDuration: TimeInterval = 3,type: String) {
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
    
    func dismiss(completion:(()->())? = nil) {
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
    
}
