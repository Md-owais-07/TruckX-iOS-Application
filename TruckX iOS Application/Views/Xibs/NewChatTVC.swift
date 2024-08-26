//
//  NewChatTVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 22/08/24.
//

import UIKit

class NewChatTVC: UITableViewCell {
    @IBOutlet weak var mainCellView: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgMessageCount: UIImageView!
    @IBOutlet weak var lblMessageNotifications: UILabel!
    @IBOutlet weak var lblMessageDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblMessageNotifications.isHidden = false
        imgMessageCount.isHidden = false
        
        imgProfile.layer.cornerRadius = self.imgProfile.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
