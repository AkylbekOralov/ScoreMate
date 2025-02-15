//
//  TeamMatchesResponse.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import Foundation
import Alamofire

struct SoccerResponse: Decodable {
    let data: [MatchData]?
}

struct MatchData: Decodable {
    let id: Int?
    let statusName: String?
    let time: Time
    let teams: Teams
    let scores: Scores
    
    enum CodingKeys: String, CodingKey {
        case id
        case statusName = "status_name"
        case time
        case teams
        case scores
    }
}

struct Time: Decodable {
    let date: String?
    let timeOclock: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case timeOclock = "time"
    }
}

struct Teams: Decodable {
    let home: TeamInfo
    let away: TeamInfo
}

struct TeamInfo: Decodable {
    let id: Int?
    let name: String?
}

struct Scores: Decodable {
    let homeScore: String?
    let awayScore: String?
    
    enum CodingKeys: String, CodingKey {
        case homeScore = "home_score"
        case awayScore = "away_score"
    }
}
