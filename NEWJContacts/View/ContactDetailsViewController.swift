//
//  ContactDetailsViewController.swift
//  NEWJContacts
//
//  Created by mmt on 28/07/21.
//

import Foundation
import UIKit

class ContactDetailsViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    var userDetailViewModel : UserDetailViewModel?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var favouriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func setupUI() {
        
        cosmeticUI()
        
        nameLabel.text = userDetailViewModel?.user?.name
        userNameLabel.text = userDetailViewModel?.user?.username
        companyLabel.text = userDetailViewModel?.user?.company?.name ?? ""
        addressLabel.text = userDetailViewModel?.user?.address?.city ?? ""
        phoneLabel.text = userDetailViewModel?.user?.phone
        websiteLabel.text = userDetailViewModel?.user?.website
        let title = userDetailViewModel?.user.isFavourite ?? false ? Constants.Strings.removeFavourite : Constants.Strings.markFavourite
        favouriteButton.setTitle(title, for: .normal)
    }
    
    @IBAction func favouriteAction(_ sender: Any) {
        userDetailViewModel?.markUserFavourite()
        let title = userDetailViewModel?.user.isFavourite ?? false ? Constants.Strings.removeFavourite : Constants.Strings.markFavourite
        favouriteButton.setTitle(title, for: .normal)
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
