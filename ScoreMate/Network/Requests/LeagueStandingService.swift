//
//  LeagueStandingService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 05.03.2025.
//

import Foundation

class LeagueStandingService {
    private let seasonId: String
    
    init(seasonId: String) {
        self.seasonId = seasonId
    }
    
    func fetchLeagueStanding(completion: @escaping (Result<[TeamModel], APIError>) -> Void) {
        let url = APIEndpoints.leagueStanding(seasonId: self.seasonId)
        
        NetworkService.getData(url: url, dataType: StandingAPIResponse.self) { result in
            switch result {
            case .success(let data):
                let leagueStanding: [TeamModel] = data.data?.standings?.compactMap { team in
                    
                    return TeamModel(
                        id: team.teamId,
                        name: team.teamName,
                        gamesPlayed: team.overall.gamesPlayed,
                        goalsScored: team.overall.goalsScored,
                        goalsAgainst: team.overall.goalsAgainst,
                        points: team.overall.points
                    )
                } ?? []
                
                completion(.success(leagueStanding))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

struct StandingAPIResponse: Decodable {
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
