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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        searchView.layer.cornerRadius = 20
//        searchView.layer.borderWidth = 1
//        searchView.layer.borderColor = UIColor.darkGray.withAlphaComponent(80).cgColor
        searchView.customizeSearchBar()
        
        btnAdd.layer.cornerRadius = 13
        btnAdd.layer.shadowRadius = 6.0
        btnAdd.layer.shadowOpacity = 0.6
        btnAdd.layer.shadowOffset = CGSize.zero
        btnAdd.layer.shadowColor = UIColor.lightGray.cgColor
        
        btnAdd.addTarget(self, action: #selector(pushToVC), for: .touchUpInside)
    }
    
    @objc func pushToVC() {
        let newChatVC = AppController.shared.NewChat
        newChatVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(newChatVC, animated: true)
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
