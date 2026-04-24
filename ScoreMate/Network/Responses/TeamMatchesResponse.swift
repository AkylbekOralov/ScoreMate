//
//  TeamMatchesAPIResponse.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.03.2025.
//

struct TeamMatchesResponse: Decodable {
    let data: [MatchData]?
}

struct MatchData: Decodable {
    let id: Int?
    let statusName: String?
    let groupName: String?
    let roundName: String?
    let stageName: String?
    let time: Time
    let teams: Teams
    let scores: Scores
    let league: MatchLeague?
    
    enum CodingKeys: String, CodingKey {
        case id
        case statusName = "status_name"
        case groupName = "group_name"
        case roundName = "round_name"
        case stageName = "stage_name"
        case time
        case teams
        case scores
        case league
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
    let nameCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameCode = "short_code"
    }
}

struct Scores: Decodable {
    let homeScore: String?
    let awayScore: String?
    
    enum CodingKeys: String, CodingKey {
        case homeScore = "home_score"
        case awayScore = "away_score"
    }
}

struct MatchLeague: Decodable {
    let name: String?
    let countryName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case countryName = "country_name"
    }
}
