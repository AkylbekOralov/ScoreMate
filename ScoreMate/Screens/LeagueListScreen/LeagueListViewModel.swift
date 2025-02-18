//
//  LeagueListViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import Foundation
import Alamofire

class LeagueListViewModel: ObservableObject {
    @Published var leagues: [LeagueModel] = []
    @Published var loading: Bool = false
    
    init() {
         fetchLeagues()
    }
    
    func fetchLeagues() {
        self.loading = true
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
                    self.loading = false
                case .failure(let error):
                    print("Error fetching leagues: \(error.localizedDescription)")
                    self.loading = false
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
