//
//  LeaguesService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 05.03.2025.
//

import Foundation

protocol LeaguesServicing: Sendable {
    func fetchLeagues(completion: @escaping (Result<[LeagueModel], APIError>) -> Void)
}

final class LeaguesService: LeaguesServicing {
    private let apiEndpoints: APIEndpointsProviding
    private let networkService: NetworkServing

    init(apiEndpoints: APIEndpointsProviding, networkService: NetworkServing) {
        self.apiEndpoints = apiEndpoints
        self.networkService = networkService
    }

    func fetchLeagues(completion: @escaping (Result<[LeagueModel], APIError>) -> Void) {
        let url = apiEndpoints.leagues()
        
        networkService.getData(
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
