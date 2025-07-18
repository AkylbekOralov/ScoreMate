//
//  LeagueTableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 03.02.2025.
//

import SwiftUI

struct LeagueTableView: View {
    @StateObject var leagueStandingViewModel: LeagueStandingViewModel
    
    var body: some View {
        VStack(spacing: Paddings.x2) {
            VStack {
                Text("League Rankings")
                    .font(.system(size: FontSizes.body, weight: .semibold))
                    .padding(.leading, Paddings.x4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: Paddings.x1)  {
                StandingTableHeaderView()
                
                ScrollView {
                    VStack {
                        ForEach(leagueStandingViewModel.leagueStanding.indices, id: \.self) { index in
                            let team = leagueStandingViewModel.leagueStanding[index]
                            let teamViewModel = TeamMatchesViewModel(league: leagueStandingViewModel.leagueModel, team: team)
                            
                                StandingTableRowView(
                                    teamId: team.id,
                                    index: index + 1,
                                    teamName: team.name,
                                    gamesPlayed: team.gamesPlayed,
                                    goalsScored: team.goalsScored,
                                    goalsAgainst: team.goalsAgainst,
                                    points: team.points,
                                    teamViewModel: teamViewModel
                                )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, Paddings.x4 )
                    .padding(.top, Paddings.x2)
                }
            }
        }
    }
}
