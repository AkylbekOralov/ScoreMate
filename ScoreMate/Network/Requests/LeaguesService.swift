//
//  LeaguesService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 05.03.2025.
//

import Foundation

class LeaguesService {
    func fetchLeagues(completion: @escaping (Result<[LeagueModel], APIError>) -> Void) {
        let url = APIEndpoints.shared.leagues()
        
        NetworkService.getData(
            url: url,
            dataType: LeaguesResponse.self,
            mockFileName: "leagues"
        ) { result in
            switch result {
            case .success(let data):
                let leagues: [LeagueModel] = data.data?.compactMap { league in
                    return LeagueModel(
                        id: league.id,
                        name: league.name,
                        countryName: league.countryName,
                        countryId: league.countryId,
                        countryCode: league.countryCode,
                        currentSeasonId: league.currentSeasonId
                    )
                } ?? []
                
                completion(.success(leagues))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
