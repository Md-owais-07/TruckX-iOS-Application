//
//  ExemptionVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 12/08/24.
//

import UIKit

class ExemptionVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    var exemptionsData: [Exemption] = []
    private let loaderView = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ExemptionTVC", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false

        btnBack.addTarget(self, action: #selector(popToView), for: .touchUpInside)
        
        setupLoader()
        fetchExemptionData()
    }
    
    func fetchExemptionData() {
        loaderView.startLoading()
        APIManager.shared.exemptionService.getExemptionData { result in
            DispatchQueue.main.async {
                self.loaderView.stopLoading()
                switch result {
                case .success(let apiResponse):
                    self.exemptionsData = apiResponse.data.docs
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print("Error fetching exemptions: \(error)")
                }
            }
        }
    }
    
}

extension ExemptionVC {
    func setupLoader() {
        loaderView.frame = view.bounds
        loaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(loaderView)
        loaderView.isHidden = true
    }
}

extension ExemptionVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exemptionsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ExemptionTVC else {
            return UITableViewCell() }
        let data = exemptionsData[indexPath.row]
        cell.headingLabel.text = data.title
        cell.descriptionLabel.text = data.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = AppController.shared.ExemptionDetails
        detailsVC.titleText = exemptionsData[indexPath.row].title
        detailsVC.image = exemptionsData[indexPath.row].image
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
