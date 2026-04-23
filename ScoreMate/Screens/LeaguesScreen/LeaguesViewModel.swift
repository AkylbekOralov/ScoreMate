//
//  LeaguesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import Foundation
import Alamofire

@MainActor
final class LeaguesViewModel: ObservableObject {
    @Published var leagues: [LeagueModel] = []
    @Published var errorMessage: String? = nil
    
    private let leaguesService: LeaguesService
    
    init() {
        self.leaguesService = LeaguesService()
        fetchLeagues()
    }
    
    func fetchLeagues() {
        self.errorMessage = nil
        
        leaguesService.fetchLeagues { result in
            switch result {
            case .success(let leagues):
                self.leagues = leagues
            case .failure(let error):
                print("LeaguesViewModel fetchLeagues error: \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
