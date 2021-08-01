//
//  Company+CoreDataClass.swift
//  NEWJContacts
//
//  Created by mmt on 30/07/21.
//
//

import Foundation
import CoreData

@objc(Company)
public class Company: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case bs
    }

    // MARK: - Decodable
    required convenience public init(from decoder: Decoder) throws {

        guard let entity = NSEntityDescription.entity(forEntityName: "Company", in: PersistenceService.context) else {
            fatalError("Failed to decode User")
        }

        self.init(entity: entity, insertInto: PersistenceService.context)

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.catchPhrase = try container.decodeIfPresent(String.self, forKey: .catchPhrase)
        self.bs = try container.decodeIfPresent(String.self, forKey: .bs)
    }

    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(catchPhrase, forKey: .catchPhrase)
        try container.encode(bs, forKey: .bs)
    }
}
