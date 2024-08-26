//
//  ChatTVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 22/08/24.
//

import UIKit

class ChatTVC: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgUserProfile.layer.cornerRadius = self.imgUserProfile.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
