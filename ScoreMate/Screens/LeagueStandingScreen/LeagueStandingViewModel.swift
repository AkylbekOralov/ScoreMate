//
//  LeagueStandingViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import Foundation
import Alamofire
import SwiftUI
import FactoryKit

@MainActor
final class LeagueStandingViewModel: ObservableObject {
    let leagueModel: LeagueModel
    @Published var leagueStanding: [TeamModel] = []
    @Published var errorMessage: String? = nil
    
    private let leagueStandingService: LeagueStandingServicing
    
    init(
        leagueModel: LeagueModel,
        leagueStandingService: LeagueStandingServicing = Container.shared.leagueStandingService()
    ) {
        self.leagueModel = leagueModel
        self.leagueStandingService = leagueStandingService
        
        fetchLeagueStanding()
    }
    
    private func fetchLeagueStanding() {
        self.errorMessage = nil
        
        leagueStandingService.fetchLeagueStanding(seasonId: String(leagueModel.currentSeasonId)) { result in
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
