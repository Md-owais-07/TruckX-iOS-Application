//
//  ExemptionTVC.swift
//  TruckX iOS Application
//
//  Created by Owais on 12/08/24.
//

import UIKit

class ExemptionTVC: UITableViewCell {
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var btnSetup: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.setShadow(radius: 10, opacity: 0.5, color: UIColor(red: 83/255, green: 125/255, blue: 151/255, alpha: 0.50), offset: CGSize(width: 0, height: 11), cornerRadius: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
