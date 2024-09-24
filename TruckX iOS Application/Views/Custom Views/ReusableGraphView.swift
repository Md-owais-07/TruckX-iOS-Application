//
//  ReusableGraphView.swift
//  TruckX iOS Application
//
//  Created by Owais on 16/08/24.
//

import UIKit

class ReusableGraphView: UIView {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var btnGotoDetails: UIButton!
    @IBOutlet weak var mainHeaderView: UIView!
    @IBOutlet weak var spaceView: UIView!
    @IBOutlet weak var mainGraphView: UIView!
    
    weak var viewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupConstraints()
        buttonStyle()
        setupButtonActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupConstraints()
        buttonStyle()
        setupButtonActions()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ReusableGraphView", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -0),
            mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -0)
        ])
    }
    
    func buttonStyle() {
        signView.layer.cornerRadius = 19
        signView.layer.borderWidth = 2
        signView.layer.borderColor = UIColor.systemGray5.withAlphaComponent(0.8).cgColor
    }
    
    private func setupButtonActions() {
        btnGotoDetails.addTarget(self, action: #selector(didTapGotoDetails), for: .touchUpInside)
    }
    
    @objc private func didTapGotoDetails() {
        guard let viewController = viewController else {
            print("ViewController is not set")
            return
        }
        
        let chartDetailsVC = AppController.shared.Logs
        self.viewController?.pushToVCWithHideTabBar(chartDetailsVC)
    }
    
}
