//
//  CycleInfoVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 19/08/24.
//

import UIKit

class CycleInfoVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    var profileData: [UserProfileModel] = []
    var cellDataItems: [CellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(cellType: MoreTVC.self, withIdentifier: "cell3")
        
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        self.cellSetUp()
        self.setupLoader()
        self.enablePopGestureRecognizer()
    }
    
}

extension CycleInfoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as? MoreTVC else {
            return UITableViewCell() }
        
        let cellData = cellDataItems[indexPath.row]
        cell.lblTitle.text = cellData.title
        cell.lblSubTitle.text = cellData.subtitle
        
        return cell
    }
}

extension CycleInfoVC {
    func populateCellData()
    {
        guard let profile = profileData.first?.data else { return }
        
        cellDataItems = [
            CellData(title: "Cycle Rule", subtitle: profile.cycle),
            CellData(title: "Cargo Type", subtitle: profile.cargoType),
            CellData(title: "Restart Hours", subtitle: "\(profile.reStart) Hours Restart"),
            CellData(title: "Rest Break Required", subtitle: "\(profile.dataBreak) Minute Rest break required")
        ]
    }
    
    func cellData()
    {
        APIManager.shared.userService.getUserProfile { response in
            DispatchQueue.main.async {
                self.hideLoader()
                switch response {
                case.success(let profileDataResponse):
                    self.profileData = [profileDataResponse]
                    self.populateCellData()
                    self.tableView.reloadData()
                case.failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    func cellSetUp()
    {
        DispatchQueue.main.async {
            self.showLoader()
            self.cellData()
        }
    }
}
