//
//  TeamMatchesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation

class TeamMatchesViewModel: ObservableObject {
    let league: LeagueModel
    let team: TeamModel
    @Published var matches: [MatchModel] = []
    
    init(league: LeagueModel, team: TeamModel) {
        self.league = league
        self.team = team
        self.matches = getMockMatches()
    }
    
    func getMockMatches() -> [MatchModel] {
        
        return [
            MatchModel(
                id: 1891183,
                date: "2024-10-19",
                homeTeam: "Auckland FC",
                homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
                homeScore: 2,
                awayTeam: "Brisbane Roar",
                awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1105.png",
                awayScore: 0),
            MatchModel(
                id: 1891192,
                date: "2024-10-27",
                homeTeam: "Auckland FC",
                homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1102.png",
                homeScore: 1,
                awayTeam: "Sydney",
                awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1097.png",
                awayScore: 0),
            MatchModel(
                id: 1891195,
                date: "2024-11-02",
                homeTeam: "Wellington",
                homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
                homeScore: 0,
                awayTeam: "Auckland FC",
                awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
                awayScore: 2)
        ]
    }
}
    
    
