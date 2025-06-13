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
        
        NetworkService.getData(url: url, dataType: LeaguesResponse.self) { result in
            switch result {
            case .success(let data):
                let leagues: [LeagueModel] = data.data?.compactMap { league in
                    guard
                        let id = Int(league.id),
                        let countryId = Int(league.countryId),
                        let currentSeasonId = Int(league.currentSeasonId)
                    else { return nil }
                    
                    return LeagueModel(
                        id: id,
                        name: league.name,
                        countryName: league.countryName,
                        countryId: countryId,
                        countryCode: league.countryCode,
                        currentSeasonId: currentSeasonId
                    )
                } ?? []
                
                completion(.success(leagues))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
