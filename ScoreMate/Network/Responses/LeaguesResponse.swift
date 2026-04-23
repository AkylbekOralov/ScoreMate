//
//  LeaguesResponse.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.06.2025.
//

import Foundation

struct LeaguesResponse: Decodable {
    let data: [LeagueData]?
}

struct LeagueData: Decodable {
    let id: Int
    let name: String
    let countryName: String
    let countryId: Int
    let countryCode: String
    let currentSeasonId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case countryName = "country_name"
        case countryId = "country_id"
        case countryCode = "cc"
        case currentSeasonId = "current_season_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try Self.decodeInt(forKey: .id, from: container)
        name = try container.decode(String.self, forKey: .name)
        countryName = try container.decode(String.self, forKey: .countryName)
        countryId = try Self.decodeInt(forKey: .countryId, from: container)
        countryCode = try container.decode(String.self, forKey: .countryCode)
        currentSeasonId = try Self.decodeInt(forKey: .currentSeasonId, from: container)
    }
    
    private static func decodeInt(
        forKey key: CodingKeys,
        from container: KeyedDecodingContainer<CodingKeys>
    ) throws -> Int {
        if let intValue = try? container.decode(Int.self, forKey: key) {
            return intValue
        }
        
        if let stringValue = try? container.decode(String.self, forKey: key),
           let intValue = Int(stringValue) {
            return intValue
        }
        
        throw DecodingError.dataCorruptedError(
            forKey: key,
            in: container,
            debugDescription: "Expected an Int or numeric String"
        )
    }
}
