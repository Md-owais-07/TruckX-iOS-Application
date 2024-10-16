//
//  MessgegesVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 10/08/24.
//

import UIKit

class MessgegesVC: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblGuest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchView.customizeSearchBar()
        addButtonSetup()
        
        tableView.isHidden = true
        
        if UserData.shared.isGuestUser {
            tableView.isHidden = true
            lblGuest.isHidden = false
        } else if UserData.shared.isLoggedIn {
            tableView.isHidden = false
            lblGuest.isHidden = true
        }
        
        tableView.register(cellType: NewChatTVC.self, withIdentifier: "cell")
        tableView.reloadData()
        tableView.showsVerticalScrollIndicator = false
        
        btnAdd.addTarget(self, action: #selector(pushToVC), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        disablePopGestureRecognizer()
    }

}

extension MessgegesVC {
    func addButtonSetup()
    {
        btnAdd.layer.cornerRadius = 13
        btnAdd.layer.shadowRadius = 6.0
        btnAdd.layer.shadowOpacity = 0.6
        btnAdd.layer.shadowOffset = CGSize.zero
        btnAdd.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    @objc func pushToVC()
    {
        let newChatVC = AppController.shared.NewChat
        self.pushToVCWithHideTabBar(newChatVC)
    }
}

extension MessgegesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewChatTVC else {
            return UITableViewCell() }
        
        return cell
    }
    
    
}
