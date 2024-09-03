//
//  NewChatVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit

class NewChatVC: UIViewController {
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblSearchMsg: UILabel!
    
    var namesDictionary = [String: [String]]()
    var filteredNamesDictionary = [String: [String]]()
    var sectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
        tableView.register(cellType: ChatTVC.self, withIdentifier: "cell")
        tableView.reloadData()
        tableView.showsVerticalScrollIndicator = false
        
        let names = ["Abdul Shaikh", "Bablu Shaikh", "Amit Singh", "Brad Pitt", "Alex Smith", "Kaif", "Zaid asad"]
        
        for name in names {
            let firstLetter = String(name.prefix(1))
            if var nameValues = namesDictionary[firstLetter] {
                nameValues.append(name)
                namesDictionary[firstLetter] = nameValues
            } else {
                namesDictionary[firstLetter] = [name]
            }
        }
        
        filteredNamesDictionary = namesDictionary
        sectionTitles = [String](filteredNamesDictionary.keys).sorted(by: { $0 < $1 })
        
        lblSearchMsg.isHidden = true
        
        searchBar.customizeSearchBar()
        searchBarTextField.delegate = self
        self.HideKeyboardWhenTapAround()
        self.enablePopGestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBarTextField.becomeFirstResponder()
    }
    
    @IBAction func searchBarAction(_ sender: UITextField) {
        if let searchText = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty {
            filteredNamesDictionary = namesDictionary.mapValues { $0.filter { $0.lowercased().contains(searchText.lowercased()) } }
            filteredNamesDictionary = filteredNamesDictionary.filter { !$0.value.isEmpty }
        } else {
            filteredNamesDictionary = namesDictionary
        }
        
        sectionTitles = [String](filteredNamesDictionary.keys).sorted(by: { $0 < $1 })
        tableView.reloadData()
    }
    
}

extension NewChatVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = sectionTitles[section]
        guard let sectionNames = namesDictionary[sectionTitle] else { return 0 }
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChatTVC else {
            return UITableViewCell() }
        let sectionTitle = sectionTitles[indexPath.section]
        if let sectionNames = namesDictionary[sectionTitle] {
            cell.lblUserName.text = sectionNames[indexPath.row].capitalized
            cell.imgUserProfile.image = UIImage(named: "profile")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
}
