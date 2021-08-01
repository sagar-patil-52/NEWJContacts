//
//  Geo+CoreDataClass.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//
//

import Foundation
import CoreData

@objc(Geo)
public class Geo: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
    }

    // MARK: - Decodable
    required convenience public init(from decoder: Decoder) throws {

        guard let entity = NSEntityDescription.entity(forEntityName: "Geo", in: PersistenceService.context) else {
            fatalError("Failed to decode User")
        }

        self.init(entity: entity, insertInto: PersistenceService.context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lat = try container.decodeIfPresent(String.self, forKey: .lat)
        self.lng = try container.decodeIfPresent(String.self, forKey: .lng)
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lat, forKey: .lat)
        try container.encode(lng, forKey: .lng)
    }
}
