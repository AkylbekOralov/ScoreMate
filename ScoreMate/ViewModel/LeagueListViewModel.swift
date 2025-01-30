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
                            self.leagues = data.data.map { LeagueModel(id: Int($0.id) ?? 0, name: $0.name, country: $0.country_name, country_id: Int($0.country_id) ?? 0) }
                        }
                    case .failure(let error):
                        print("Error fetching leagues: \(error.localizedDescription)")
                    }
                }
        }
    
    
    func getMockLeagues() -> [LeagueModel] {
        return [
            LeagueModel(id: 974, name: "A-League", country: "Australia", country_id: 14),
            LeagueModel(id: 1005, name: "Tipico Bundesliga", country: "Austria", country_id: 15),
            LeagueModel(id: 1609, name: "Superliga", country: "Denmark", country_id: 37)
        ]
    }
}

struct APIResponse: Decodable {
    let data: [LeagueData]
}

struct LeagueData: Decodable {
    let id: String
    let name: String
    let country_name: String
    let country_id: String
}
