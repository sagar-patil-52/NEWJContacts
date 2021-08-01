//
//  UserDetailViewModel.swift
//  NEWJContacts
//
//  Created by mmt on 29/07/21.
//

import Foundation

class UserDetailViewModel {
    
    let user : User!
    init(userId : Int) {
        self.user = LocalStorageHandler().fetchUser(id: userId)
    }
    
    func fetchUser() -> User? {
        return LocalStorageHandler().fetchUser(id: Int(user.id))
    }
    
    func markUserFavourite() {
        if let userId = user?.id {
            LocalStorageHandler().markUserFavourite(id: Int(userId))
        }
    }
}
