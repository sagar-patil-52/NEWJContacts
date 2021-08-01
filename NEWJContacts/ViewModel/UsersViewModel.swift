//
//  UsersViewModel.swift
//  NEWJContacts
//
//  Created by mmt on 27/07/21.
//

import Foundation

class UsersViewModel {
    
    var users = BoxBind(value: [User]())
    func fetchUsers() {
        users.value.removeAll()
//        let arr = UserDefaults.standard.fetchStoredUsers()
        
        if let lusers = LocalStorageHandler().fetchData(), lusers.count > 0 {
            users.value.append(contentsOf: lusers)
        } else {
            let apiHandler = APIHandler()
            apiHandler.getUsers(completionHandler: { [weak self] (data, error) -> (Void) in
                    if let data = data as? [User] {
                        self?.users.value = data
//                        UserDefaults.standard.storeUsers(value: data)
                        LocalStorageHandler().saveData()
                }
            })
        }
    }
    
    func getUsers() -> [User] {
        return users.value
    }
}
