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
        self.leagues = fetchLeagues()
    }
    
    func fetchLeagues() -> [LeagueModel] {
        return [
            LeagueModel(id: 974, name: "A-League", country: "Australia"),
            LeagueModel(id: 1005, name: "Tipico Bundesliga", country: "Austria"),
            LeagueModel(id: 1609, name: "Superliga", country: "Denmark")
        ]
    }
}
