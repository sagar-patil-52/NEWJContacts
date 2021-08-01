//
//  UserTableViewCell.swift
//  NEWJContacts
//
//  Created by mmt on 27/07/21.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellBg: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell( user : User) {
        styleCell()
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        companyLabel.text = user.company?.name ?? ""
        if user.isFavourite == true {
            favouriteButton.setImage(UIImage.init(systemName: "star.fill"), for: .normal)
            favouriteButton.tintColor = .red
        } else {
            favouriteButton.setImage(UIImage.init(systemName: "star"), for: .normal)
            favouriteButton.tintColor = .white
        }

    }
    
    func styleCell()  {
        
        let gradient = CAGradientLayer()
        gradient.frame = cellBg.bounds
        gradient.startPoint = CGPoint.init(x: 0, y: 0)
        gradient.endPoint = CGPoint.init(x: 1, y: 1)
        gradient.colors = [Constants.Colors.blueColor.cgColor, Constants.Colors.darkBlueColor.cgColor]
        cellBg.layer.insertSublayer(gradient, at: 0)
        
        cellBg.layer.cornerRadius = 15
        gradient.cornerRadius = cellBg.layer.cornerRadius
        cellBg.layer.shadowOpacity = 0.5
        cellBg.layer.shadowColor = UIColor.white.cgColor
        cellBg.layer.masksToBounds = true;
        cellBg.layer.shadowRadius = 3
        cellBg.layer.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        cellBg.layer.borderWidth = 0.5
        cellBg.layer.borderColor = Constants.Colors.blueColor.cgColor
        
    }
}
