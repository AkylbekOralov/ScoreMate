//
//  TeamMatchesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation
import Alamofire

enum Selection {
    case results
    case calendar
}

class TeamMatchesViewModel: ObservableObject {
    let league: LeagueModel
    let team: TeamModel
    var finishedMatches: [MatchModel] = []
    var upcomingMatches: [MatchModel] = []
    @Published var displayedMatches: [MatchModel] = []
    @Published var selection: Selection
    
    init(league: LeagueModel, team: TeamModel) {
        self.league = league
        self.team = team
        self.selection = .results
        self.finishedMatches = getMockFinishedMatches()
        self.upcomingMatches = getMockUpcomingMatches()
        setDisplayedMatches()
    }
    
    func changeSelection(selected: Selection) {
        self.selection = selected
        setDisplayedMatches()
    }
    
    func setDisplayedMatches(){
        switch selection {
        case .results:
            displayedMatches = finishedMatches
        case .calendar:
            displayedMatches = upcomingMatches
        }
    }
    
    func getMockFinishedMatches() -> [MatchModel] {
        
        return [
            MatchModel(
                id: 1891183,
                date: "2024-10-19",
                homeTeam: "Auckland FC",
                homeTeamId: 1931466026,
                homeScore: 2,
                awayTeam: "Brisbane Roar",
                awayTeamId: 1105,
                awayScore: 0),
            MatchModel(
                id: 1891192,
                date: "2024-10-27",
                homeTeam: "Auckland FC",
                homeTeamId: 1102,
                homeScore: 1,
                awayTeam: "Sydney",
                awayTeamId: 1097,
                awayScore: 0),
            MatchModel(
                id: 1891195,
                date: "2024-11-02",
                homeTeam: "Wellington",
                homeTeamId: 1931466026,
                homeScore: 0,
                awayTeam: "Auckland FC",
                awayTeamId: 1931466026,
                awayScore: 2)
        ]
    }
    
    func getMockUpcomingMatches() -> [MatchModel] {
        return [
            MatchModel(
                id: 1891183,
                date: "2023-10-19",
                homeTeam: "Real Madrid",
                homeTeamId: 11,
                homeScore: 3,
                awayTeam: "Brisbane Roar",
                awayTeamId: 1105,
                awayScore: 0),
            MatchModel(
                id: 1891192,
                date: "2024-10-27",
                homeTeam: "Bayern",
                homeTeamId: 11,
                homeScore: 1,
                awayTeam: "Sydney",
                awayTeamId: 11,
                awayScore: 0),
            MatchModel(
                id: 1891195,
                date: "2024-11-02",
                homeTeam: "Barcelona",
                homeTeamId: 15,
                homeScore: 0,
                awayTeam: "Auckland FC",
                awayTeamId: 16,
                awayScore: 2)
        ]
    }
}


