//
//  LeaguesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import Foundation
import Alamofire
import FactoryKit

@MainActor
final class LeaguesViewModel: ObservableObject {
    @Published var leagues: [LeagueModel] = []
    @Published var errorMessage: String? = nil
    
    private let leaguesService: LeaguesServicing
    
    init(leaguesService: LeaguesServicing = Container.shared.leaguesService()) {
        self.leaguesService = leaguesService
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
