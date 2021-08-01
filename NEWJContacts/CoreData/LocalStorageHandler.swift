//
//  LocalStorageHandler.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//

import Foundation
import CoreData

class LocalStorageHandler  {
        
    func storeData<T>( entity : T) {
        
        let entityName = Constants.Strings.user
        NSEntityDescription.insertNewObject(forEntityName: entityName,
                                                            into: PersistenceService.context)
    }
    
    func fetchData() -> [User]? {
        var users = [User]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.Strings.user)
        request.returnsObjectsAsFaults = false
        do {
            let result = try PersistenceService.context.fetch(request)
            for data in result as! [NSManagedObject] {
                if let user = data as? User {
                    users.append(user)
                }
            }
        } catch {
            print(Constants.Error.dataFetchError)
        }
        return users
    }
    
    func fetchUser(id : Int) -> User? {
        
        let predicate = NSPredicate(format: "id = %d" , id)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.Strings.user)
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try PersistenceService.context.fetch(request)
            for data in result as! [NSManagedObject] {
                if let user = data as? User {
                    return user
                }
            }
        } catch {
            print(Constants.Error.dataFetchError)
        }
        return nil
    }
    
    
    func markUserFavourite(id : Int) {
        
        let datePredicate = NSPredicate(format: "id = %d" , id)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.Strings.user)
        request.predicate = datePredicate
        request.returnsObjectsAsFaults = false
        do {
            let result = try PersistenceService.context.fetch(request)
            for data in result as! [NSManagedObject] {
                if let user = data as? User {
                    user.isFavourite = !user.isFavourite
                }
            }
            PersistenceService.saveContext()
        } catch {
            print(Constants.Error.dataFetchError)
        }
    }
    
    func saveData() {
        PersistenceService.saveContext()
    }
}

