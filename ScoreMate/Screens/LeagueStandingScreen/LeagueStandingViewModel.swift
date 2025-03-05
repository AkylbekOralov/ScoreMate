//
//  StandingTableViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import Foundation
import Alamofire
import SwiftUI

class LeagueStandingViewModel: ObservableObject {
    let leagueModel: LeagueModel
    let accentColor: Color
    @Published var leagueStanding: [TeamModel] = []
    @Published var errorMessage: String? = nil
    
    private let leagueStandingService: LeagueStandingService
    
    init(leagueModel: LeagueModel) {
        self.leagueModel = leagueModel
        leagueStandingService = LeagueStandingService(
            seasonId: String(self.leagueModel.currentSeasonId)
        )
        
        switch leagueModel.name {
        case "A-League":
            self.accentColor = Backgrounds.aLeague
        case "Tipico Bundesliga":
            self.accentColor = Backgrounds.tipicoBundusligo
        case "Superliga":
            self.accentColor = Backgrounds.superLiga
        default:
            self.accentColor = Backgrounds.aLeague
        }
        
        fetchLeagueStanding()
    }
    
    private func fetchLeagueStanding() {
        self.errorMessage = nil
        
        leagueStandingService.fetchLeagueStanding { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let leagueStanding):
                    self.leagueStanding = leagueStanding
                case .failure(let error):
                    print("LeagueStandingViewModel fetchLeagueStanding error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
