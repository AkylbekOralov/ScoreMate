//
//  Endpoint.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 04.03.2025.
//

enum APIEndpoints {
    static let baseURL = "https://api.soccersapi.com/v2.2"
    static let user = ApiCall.username
    static let token = ApiCall.token
    
    static func leagues() -> String {
        return "\(baseURL)/leagues/?user=\(user)&token=\(token)&t=list"
    }
    
    static func leagueStanding(seasonId: String) -> String {
        return "\(baseURL)/leagues/?user=\(user)&token=\(token)&t=standings&season_id=\(seasonId)"
    }
    
    static func matchesByDate(date: String) -> String {
        return "\(baseURL)/fixtures/?user=\(user)&token=\(token)&t=schedule&d=\(date)"
    }
    
    static func teamMatches(seasonId: String, teamId: String) -> String {
        return "https://api.soccersapi.com/v2.2/fixtures/?user=\(user)&token=\(token)&t=season&season_id=\(seasonId)&team_id=\(teamId)"
    }
}
