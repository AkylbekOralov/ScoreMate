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
    
    init() {
        fetchLeagues()
        //self.leagues = getMockLeagues()
    }
    
    
    func fetchLeagues() {
        let url = "https://api.soccersapi.com/v2.2/leagues/?user=oralovv26&token=69459e6f12e2752fa14a2d95b8c64f34&t=list"

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: APIResponse.self) { response in
                
                switch response.result {
                    
                case .success(let data):
                    DispatchQueue.main.async {
                        
                        self.leagues = data.data?.compactMap { league in
                            
                            guard
                                let id = Int(league.id),
                                let countryId = Int(league.countryId),
                                let currentSeasonId = Int(league.currentSeasonId)
                            else { return nil }
                            
                            return LeagueModel(id: id, name: league.name, countryName: league.countryName, countryId: countryId, countryCode: league.countryCode, currentSeasonId: currentSeasonId)
                            
                        } ?? []
                        
                    }
                    
                case .failure(let error):
                    print("Error fetching leagues: \(error.localizedDescription)")
                    
                }
                
            }
    }
    
    
    func getMockLeagues() -> [LeagueModel] {
        return [
            LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593),
            LeagueModel(id: 1005, name: "Tipico Bundesliga", countryName: "Austria", countryId: 15, countryCode: "at", currentSeasonId: 14418),
            LeagueModel(id: 1609, name: "Superliga", countryName: "Denmark", countryId: 37, countryCode: "dk", currentSeasonId: 14319)
        ]
    }
}

struct APIResponse: Decodable {
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
