//
//  BottomVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 28/08/24.
//

import UIKit

class BottomVC: UIViewController {
    @IBOutlet weak var imgBluetooth: UIImageView!
    @IBOutlet weak var lblBluetoothText: UILabel!
    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgBluetooth.applyCircularCornerRadius()
        refreshButtonSetUp()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
    }
    
}


extension BottomVC {
    func refreshButtonSetUp() {
        let refreshButton = DesignableButton(type: .system)
        
        refreshButton.setTitle("Tap to Refresh", for: .normal)
        
        refreshButton.setTitleColor(#colorLiteral(red: 0, green: 0.3433497846, blue: 0.3613733053, alpha: 1), for: .normal)
        
        refreshButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        let refreshImage = UIImage(named: "Vector (20)")
        refreshButton.setImage(refreshImage, for: .normal)
        
        refreshButton.tintColor = #colorLiteral(red: 0, green: 0.3433497846, blue: 0.3613733053, alpha: 1)
        
        refreshButton.contentHorizontalAlignment = .center
        refreshButton.semanticContentAttribute = .forceLeftToRight
        
        refreshButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        refreshButton.backgroundColor = .white
        
        refreshButton.cornerRadius = 10
        refreshButton.borderWidth = 2
        refreshButton.borderColor = #colorLiteral(red: 0, green: 0.3433497846, blue: 0.3613733053, alpha: 1)
        
        refreshButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        view.addSubview(refreshButton)
        
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            refreshButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            refreshButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            refreshButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 297),
            refreshButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            refreshButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
