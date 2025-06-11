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
        let url = APIEndpoints.shared.leagueStanding(seasonId: self.seasonId)
        
        NetworkService.getData(url: url, dataType: StandingResponse.self) { result in
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
