//
//  LeagueListViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import Foundation
import Alamofire

class LeaguesViewModel: ObservableObject {
    @Published var leagues: [LeagueModel] = []
    @Published var errorMessage: String? = nil
    
    init() {
        // TODO: await/completetion handler
        fetchLeagues()
    }
    
    func fetchLeagues() {
        self.errorMessage = nil
        let url = "https://api.soccersapi.com/v2.2/leagues/?user=\(ApiCall.username)&token=\(ApiCall.token)&t=list"
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: LeaguesAPIResponse.self) { response in
                
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        
                        self.leagues = data.data?.compactMap { league in
                            
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
                    }
                case .failure(let error):
                    print("LeagueListViewModel error fetching leagues: \(error.localizedDescription)")
                    self.errorMessage = "Failed to load leagues. Please try again."
                }
            }
    }
}

struct LeaguesAPIResponse: Decodable {
    let data: [LeagueData]?
}

struct LeagueData: Decodable {
    let id: String
    let name: String
    let countryName: String
    let countryId: String
    let countryCode: String
    let currentSeasonId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case countryName = "country_name"
        case countryId = "country_id"
        case countryCode = "cc"
        case currentSeasonId = "current_season_id"
    }
}
