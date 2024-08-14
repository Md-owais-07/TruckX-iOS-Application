//
//  NewChatVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit

class NewChatVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var allData: [String] = ["Hello1", "demo", "name", "America", "Japan", "United"]
    
    var dataArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        tableView.register(UINib(nibName: "DemoTVC", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.reloadData()
        
        self.dataArr = allData
        
        searchBar.customizeSearchBar()
        searchBarTextField.delegate = self
        self.HideKeyboardWhenTapAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBarTextField.becomeFirstResponder()
    }
    
    @objc func popToVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchBarAction(_ sender: UITextField) {
        if let searchText = sender.text {
            dataArr = searchText.isEmpty ? allData : allData.filter{ $0.lowercased().contains(searchText.lowercased()) }
            if dataArr.isEmpty {
                self.toastView(toastMessage: "No data found", type: "error")
            }
            tableView.reloadData()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewChatVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DemoTVC else {
            return UITableViewCell() }
        cell.lblText.text = dataArr[indexPath.row].uppercased()
        return cell
    }
    
    
}
