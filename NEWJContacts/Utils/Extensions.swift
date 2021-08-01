//
//  Extensions.swift
//  MediTracker
//
//  Created by mmt on 27/07/21.
//

import Foundation

extension UserDefaults{

    //MARK: Check Login
    func storeUsers(value: [User]) {
                
        if let data = try? PropertyListEncoder().encode(value) {
            UserDefaults.standard.set(data, forKey: Constants.Strings.users)
        }
        synchronize()
    }

    func fetchStoredUsers() -> [User]? {
        
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: Constants.Strings.users) {
            print("data : \(data)")
            return try? PropertyListDecoder().decode([User].self, from: data)
        }
        return nil
    }
    
    func getUserForId(id : Int) -> User? {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: Constants.Strings.users) {
            var array = try? PropertyListDecoder().decode([User].self, from: data)
            return array?.filter{ $0.id == id }.first
        }
        return nil
    }
    
    func markFavourite(id : Int) {
        var tempArr = [User]()
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: Constants.Strings.users) {
            var array = try? PropertyListDecoder().decode([User].self, from: data)
            if let array = array {
                for index in 0..<array.count {
                    var user = array[index]
                    if user.id == id {
                        user.isFavourite = true
                    }
                    tempArr.append(user)
                }
            }
        }
        
        if let data1 = try? PropertyListEncoder().encode(tempArr) {
            UserDefaults.standard.set(data1, forKey: Constants.Strings.users)
        }        
        synchronize()
        
        print("userdefaults : \(UserDefaults.standard.dictionaryRepresentation())")

        
        let arr = fetchStoredUsers()
        print("stored array : \(arr)")
    }
}
