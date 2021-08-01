//
//  Address+CoreDataClass.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//
//

import Foundation
import CoreData

@objc(Address)
public class Address: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case street
        case suite
        case city
        case zipcode
        case user
        case geo

    }

    // MARK: - Decodable
    required convenience public init(from decoder: Decoder) throws {

        guard let entity = NSEntityDescription.entity(forEntityName: "Address", in: PersistenceService.context) else {
            fatalError("Failed to decode User")
        }

        self.init(entity: entity, insertInto: PersistenceService.context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.suite = try container.decodeIfPresent(String.self, forKey: .suite)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.zipcode = try container.decodeIfPresent(String.self, forKey: .zipcode)
        self.geo = try container.decodeIfPresent(Geo.self, forKey: .geo)
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(suite, forKey: .suite)
        try container.encode(zipcode, forKey: .zipcode)
        try container.encode(geo, forKey: .geo)
    }
}
