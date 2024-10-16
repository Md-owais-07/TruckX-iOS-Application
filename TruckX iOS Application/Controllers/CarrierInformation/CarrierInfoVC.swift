//
//  CarrierInfoVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

class CarrierInfoVC: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblGuestAlert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        tableView.register(cellType: MoreTVC.self, withIdentifier: "cell3")
        tableView.reloadData()
        
        if UserData.shared.isGuestUser {
            tableView.isHidden = true
            lblGuestAlert.isHidden = false
            UserData.shared.isGuestUser = false
        } else if UserData.shared.isLoggedIn {
            tableView.isHidden = false
            lblGuestAlert.isHidden = true
        }
        
        self.enablePopGestureRecognizer()
    }

}

extension CarrierInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as? MoreTVC else {
            return UITableViewCell() }
        
        return cell
    }
    
    
}
