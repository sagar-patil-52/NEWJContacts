//
//  User+CoreDataClass.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {

        case name
        case id
        case username
        case website
        case email
        case phone
        case isFavourite
        case address
        case company
    }

    // MARK: - Decodable
    required convenience public init(from decoder: Decoder) throws {

        guard let entity = NSEntityDescription.entity(forEntityName: "User", in: PersistenceService.context) else {
            fatalError("Failed to decode User")
        }

        self.init(entity: entity, insertInto: PersistenceService.context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.website = try container.decodeIfPresent(String.self, forKey: .website)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.id = try container.decodeIfPresent(Int64.self, forKey: .id) ?? 0
        self.isFavourite = try container.decodeIfPresent(Bool.self, forKey: .isFavourite) ?? false

//        self.company = try Company.init(from: )
//        self.address = try Address.init(from: (try container.decode(Address.self, forKey: .address)) as! Decoder)

//        self.company = try container.decodeIfPresent(Company.self, forKey: .company)
        self.company = try container.decode(Company.self, forKey: .company) as Company
        self.address = try container.decode(Address.self, forKey: .address) as Address

//        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(username, forKey: .username)
        try container.encode(phone, forKey: .phone)
        try container.encode(website, forKey: .website)
        try container.encode(id, forKey: .id)
        try container.encode(isFavourite, forKey: .isFavourite)
        try container.encode(company as! Company, forKey: .company)
        try container.encode(address as! Address, forKey: .address)

//        try container.encode(company, forKey: .company)
//        try container.encode(address, forKey: .address)
    }
}
