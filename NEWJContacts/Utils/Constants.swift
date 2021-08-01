//
//  Constants.swift
//  MediTracker
//
//  Created by mmt on 27/07/21.
//

import Foundation
import UIKit

struct Constants {
    
    struct TableConfig {
        static let rowHeight : CGFloat = 110
    }
    
    struct Colors {
        static let blueColor = UIColor.init(red: 80/255, green:140/255, blue: 160/255, alpha: 1)
        static let darkBlueColor = UIColor.init(red: 45/255, green:50/255, blue: 69/255, alpha: 1)
    }
    
    struct URLList {
        static let baseURL = "https://jsonplaceholder.typicode.com/"
        static let users = "users"
        
    }
    
    struct Strings {
        static let users = "Users"
        static let user = "User"
        static let container = "NEWJContacts"
        static let removeFavourite = "Remove Favorite"
        static let markFavourite = "Mark Favourite"
    }
    
    struct Error {
        static let dataFetchError = "Failed to fetch data from url"
        static let errorAlertTitle = "Oops"
    }
    
    struct Identifiers {
        static let main = "Main"
        static let historyTableViewCell = "UserTableViewCell"
    }
}
