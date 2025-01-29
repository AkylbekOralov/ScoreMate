//
//  LeagueListViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import Foundation

class LeagueListViewModel: ObservableObject {
    @Published var leagues: [LeagueModel] = []
    
    init() {
        fetchLeagues()
    }
    
    func fetchLeagues() {
        let url = URL(string: "https://api.soccersapi.com/v2.2/leagues/?user=oralovv26&token=69459e6f12e2752fa14a2d95b8c64f34&t=list")!
        
        // Make GET request using URLSession
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching leagues: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                // Parse the JSON response
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let data = jsonResponse["data"] as? [[String: Any]] {
                    DispatchQueue.main.async {
                        self.leagues = data.compactMap { leagueData in
                            guard let id = leagueData["id"] as? String,
                                  let name = leagueData["name"] as? String,
                                  let countryName = leagueData["country_name"] as? String else {
                                return nil
                            }
                            return LeagueModel(id: Int(id) ?? 0, name: name, country: countryName)
                        }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }.resume()
    }
}
