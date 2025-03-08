//
//  TeamMatchesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation
import Alamofire

class TeamMatchesViewModel: ObservableObject {
    enum TeamMatchesSelection {
        case results
        case calendar
    }
    
    let league: LeagueModel
    let team: TeamModel
    var finishedMatches: [MatchModel] = []
    var upcomingMatches: [MatchModel] = []
    @Published var displayedMatches: [MatchModel] = []
    @Published var selection: TeamMatchesSelection
    @Published var errorMessage: String? = nil
    
    private var teamMatchesService: TeamMatchesService = TeamMatchesService()
    
    init(league: LeagueModel, team: TeamModel) {
        self.league = league
        self.team = team
        self.selection = .results
        fetchMatches()
    }
    
    func changeSelection(selected: TeamMatchesSelection) {
        self.selection = selected
        setDisplayedMatches()
    }
    
    private func setDisplayedMatches(){
        switch selection {
        case .results:
            displayedMatches = finishedMatches
        case .calendar:
            displayedMatches = upcomingMatches
        }
    }
    
    func fetchMatches() {
        self.errorMessage = nil
        
        teamMatchesService.fetchTeamMatches(seasonId: league.currentSeasonId, teamId: team.id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let teamMatchesModel):
                    self.finishedMatches = teamMatchesModel.finishedMatches
                    self.upcomingMatches = teamMatchesModel.upcomingMatches
                    self.setDisplayedMatches()
                case .failure(let error):
                    print("TeamMatchesViewModel: fetchMatches error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
