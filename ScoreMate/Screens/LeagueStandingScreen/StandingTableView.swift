//
//  TableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 03.02.2025.
//

import SwiftUI

struct LeagueTableView: View {
    
    @StateObject var leagueStandingViewModel: LeagueStandingViewModel
    
    var body: some View {
        VStack  {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 40)
                .overlay (
                    StandingTableHeaderView(),
                    alignment: .center
                )
            
            ScrollView {
                VStack {
                    ForEach(leagueStandingViewModel.standings.indices, id: \.self) { index in
                        let team = leagueStandingViewModel.standings[index]
                        let teamViewModel = TeamMatchesViewModel(league: leagueStandingViewModel.leagueModel, team: team)
                        
                        NavigationLink(destination: TeamMatchesView(teamMatchesViewModel: teamViewModel)) {
                            StandingTableRowView(
                                teamId: team.id,
                                index: index + 1,
                                teamName: team.name,
                                gamesPlayed: team.gamesPlayed,
                                goalsScored: team.goalsScored,
                                goalsAgainst: team.goalsAgainst,
                                points: team.points
                            )
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

struct LeagueTableView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        NavigationStack {
            LeagueTableView(leagueStandingViewModel: LeagueStandingViewModel(leagueModel: leagueModel))
        }
    }
    
}
