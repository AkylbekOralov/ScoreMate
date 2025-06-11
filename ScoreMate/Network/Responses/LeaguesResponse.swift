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
    let id: String
    let name: String
    let countryName: String
    let countryId: String
    let countryCode: String
    let currentSeasonId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case countryName = "country_name"
        case countryId = "country_id"
        case countryCode = "cc"
        case currentSeasonId = "current_season_id"
    }
}

