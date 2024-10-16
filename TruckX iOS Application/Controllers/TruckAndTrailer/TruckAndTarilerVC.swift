//
//  TruckAndTarilerVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

class TruckAndTarilerVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblAlert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(cellType: TopTVC.self, withIdentifier: "cell2")
        tableView.register(cellType: TruckAndTarilerTVC.self, withIdentifier: "cell")
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.reloadData()
        
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        if UserData.shared.isGuestUser {
            tableView.isHidden = true
            lblAlert.isHidden = false
            UserData.shared.isGuestUser = false
        } else if UserData.shared.isLoggedIn {
            tableView.isHidden = false
            lblAlert.isHidden = true
        }
        
        self.enablePopGestureRecognizer()
    }
}

extension TruckAndTarilerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row % 2 {
        case 0:
            let cell: TopTVC = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TopTVC
            return cell
        case 1:
            let cell: TruckAndTarilerTVC = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TruckAndTarilerTVC
            return cell
        default:
            fatalError("Unexpected row index")
        }
    }
}

