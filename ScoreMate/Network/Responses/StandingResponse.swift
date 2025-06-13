//
//  StandingResponse.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.06.2025.
//

import Foundation

struct StandingResponse: Decodable {
    let data: LeagueStandingsData?
}

struct LeagueStandingsData: Decodable {
    let standings: [TeamModelData]?
}

struct TeamModelData: Decodable {
    let teamId: Int
    let teamName: String
    let overall: OverallStats
    
    enum CodingKeys: String, CodingKey {
        case teamId = "team_id"
        case teamName = "team_name"
        case overall
    }
}

struct OverallStats: Decodable {
    let gamesPlayed: Int
    let goalsScored: Int
    let goalsAgainst: Int
    let points: Int
    
    enum CodingKeys: String, CodingKey {
        case gamesPlayed = "games_played"
        case goalsScored = "goals_scored"
        case goalsAgainst = "goals_against"
        case points
    }
}
