//
//  TeamMatchesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

enum Selection {
    case results
    case calendar
}

struct TeamMatchesView: View {
    
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    @State var selection: Selection = .results
    
    var body: some View {
        VStack(spacing: 0) {
            TeamInfoView(league: teamMatchesViewModel.league, team: teamMatchesViewModel.team)
                .padding(.bottom, 30)
                .background(Color.green.opacity(0.3))
            
            HStack {
                Text("Results")
                    .foregroundColor(selection == .results ? .accentColor : .primary)
                    .underline(selection == .results, color: .accentColor)
                    .onTapGesture {
                        selection = .results
                    }
                
                Text("Calendar")
                    .foregroundColor(selection == .calendar ? .accentColor : .primary)
                    .underline(selection == .calendar, color: .accentColor)
                    .onTapGesture {
                        selection = .calendar
                    }
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.vertical, 10)
            .background(Color.green.opacity(0.7))
            
            ScrollView {
                LazyVStack {
                    ForEach(teamMatchesViewModel.finishedMatches) { match in
                        MatchView(match: match)
                        Rectangle().fill(Color.gray.opacity(0.1)).frame(height: 2)
                    }
                }
            }
            .padding(.top, 20)
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
