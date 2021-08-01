//
//  User+CoreDataProperties.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var username: String?
    @NSManaged public var website: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var address: Address?
    @NSManaged public var company: Company?

}

extension User : Identifiable {

}
