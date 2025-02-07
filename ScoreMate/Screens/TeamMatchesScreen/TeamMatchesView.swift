//
//  TeamMatchesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct TeamMatchesView: View {
    
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    
    var body: some View {
        VStack {
            TeamInfoView(league: teamMatchesViewModel.league, team: teamMatchesViewModel.team)
                .padding(.bottom, 30)
                .background(Color.green.opacity(0.3))
            
            LazyVStack {
                ForEach(teamMatchesViewModel.matches) { match in
                    MatchView(match: match)
                    Rectangle().fill(Color.gray.opacity(0.1)).frame(height: 2)
                }
            }
            Spacer()
        }
    }
}

struct TeamMatchesView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static let teamModel = TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33)
    
    static var previews: some View {
        TeamMatchesView(teamMatchesViewModel: TeamMatchesViewModel(league: leagueModel, team: teamModel))
    }
}
