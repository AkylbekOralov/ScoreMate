//
//  LeagueStandingService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 05.03.2025.
//

import Foundation

protocol LeagueStandingServicing: Sendable {
    func fetchLeagueStanding(seasonId: String, completion: @escaping (Result<[TeamModel], APIError>) -> Void)
}

final class LeagueStandingService: LeagueStandingServicing {
    private let apiEndpoints: APIEndpointsProviding
    private let networkService: NetworkServing

    init(apiEndpoints: APIEndpointsProviding, networkService: NetworkServing) {
        self.apiEndpoints = apiEndpoints
        self.networkService = networkService
    }
    
    func fetchLeagueStanding(seasonId: String, completion: @escaping (Result<[TeamModel], APIError>) -> Void) {
        let url = apiEndpoints.leagueStanding(seasonId: seasonId)
        
        networkService.getData(
            url: url,
            dataType: StandingResponse.self,
            mockFileName: "league_standing"
        ) { result in
            switch result {
            case .success(let data):
                let leagueStanding: [TeamModel] = data.data?.standings.compactMap { team in
                    
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
