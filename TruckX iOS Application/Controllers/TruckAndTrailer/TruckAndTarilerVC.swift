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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(cellType: TopTVC.self, withIdentifier: "cell2")
        tableView.register(cellType: TruckAndTarilerTVC.self, withIdentifier: "cell")
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.reloadData()
        
        btnBack.addTarget(self, action: #selector(popToView), for: .touchUpInside)
    }
    

}

extension TruckAndTarilerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows you want to display
        return 4 // For example, return 10 rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row % 2 {
        case 0:
            let cell: TopTVC = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TopTVC
            // Configure your cell for TopTVC
            return cell
        case 1:
            let cell: TruckAndTarilerTVC = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TruckAndTarilerTVC
            // Configure your cell for TruckAndTarilerTVC
            return cell
        default:
            fatalError("Unexpected row index")
        }
    }
}

