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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnBack.addTarget(self, action: #selector(popToVC), for: .touchUpInside)
        
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
        print("SEARCH BAR ACTION.")
    }
    
}
