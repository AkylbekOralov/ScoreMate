//
//  TeamMatchesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct TeamMatchesView: View {
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.88, green: 0.91, blue: 0.93), location: 0.00),
                    Gradient.Stop(color: .white, location: 0.35),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea(.all)
            
            Button(action: {
                dismiss()
            }) {
                Image("backButton")
                    .padding(.leading, Paddings.x4)
                    .padding(.top, Paddings.x1)
            }
            .zIndex(1)
            
            VStack(spacing: 0) {
                TeamInfoView(league: teamMatchesViewModel.league, team: teamMatchesViewModel.team)
                
                VStack {
                    SelectionTabView(teamMatchesViewModel: teamMatchesViewModel)
                }
                .padding(3)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(25)

                ScrollView {
                    LazyVStack(spacing: Paddings.x4) {
                        ForEach(teamMatchesViewModel.displayedMatches) { match in
                            if teamMatchesViewModel.selection == .results {
                                FinishedMatchView(match: match)
                            } else {
                                UpcomingMatchView(match: match)
                            }
                        }
                    }
                    .padding(.top, Paddings.x8)
                }
            }
            .navigationBarBackButtonHidden(true)
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
