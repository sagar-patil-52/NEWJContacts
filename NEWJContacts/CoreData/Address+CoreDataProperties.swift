//
//  Address+CoreDataProperties.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var street: String?
    @NSManaged public var suite: String?
    @NSManaged public var city: String?
    @NSManaged public var zipcode: String?
    @NSManaged public var user: User?
    @NSManaged public var geo: Geo?

}

extension Address : Identifiable {

}
