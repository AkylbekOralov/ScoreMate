//
//  LeagueStandingViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import Foundation
import Alamofire
import SwiftUI

class LeagueStandingViewModel: ObservableObject {
    let leagueModel: LeagueModel
    @Published var leagueStanding: [TeamModel] = []
    @Published var errorMessage: String? = nil
    @ObservedObject private var colors = Colors.shared
    
    private let leagueStandingService: LeagueStandingService
    
    init(leagueModel: LeagueModel) {
        self.leagueModel = leagueModel
        self.leagueStandingService = LeagueStandingService(
            seasonId: String(self.leagueModel.currentSeasonId)
        )
        
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
