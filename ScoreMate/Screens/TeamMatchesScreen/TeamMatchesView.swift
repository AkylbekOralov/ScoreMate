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
                
                //SelectionTabView(teamMatchesViewModel: teamMatchesViewModel)
                VStack {
                    ToggleNavBar()
                }
                .padding(3)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(25)
                
                ScrollView {
                    LazyVStack {
                        ForEach(teamMatchesViewModel.displayedMatches) { match in
                            MatchView(match: match)
                            Rectangle().fill(Color.gray.opacity(0.1)).frame(height: 2)
                        }
                    }
                }
                .padding(.top, 20)
                Spacer()
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
