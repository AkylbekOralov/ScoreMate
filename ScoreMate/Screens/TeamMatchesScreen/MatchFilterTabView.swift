//
//  MatchFilterTabView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct MatchFilterTabView: View {
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    var grayColor = Color(red: 0.44, green: 0.44, blue: 0.44)
    var lightGrayColor = Color(red: 0.96, green: 0.96, blue: 0.96)
    var redColor = Color(red: 0.8, green: 0.18, blue: 0.17)
    
    var body: some View {
        VStack {
            HStack(spacing: Paddings.x11) {
                Text("Results")
                    .foregroundColor(teamMatchesViewModel.selection == .results ? .white : grayColor)
                    .animation(
                        Animation.default
                    )
                    .onTapGesture {
                        withAnimation {
                            teamMatchesViewModel.changeSelection(selected: .results)
                        }
                    }
                
                Text("Calendar")
                    .foregroundColor(teamMatchesViewModel.selection == .calendar ? .white : grayColor)
                    .animation(
                        Animation.default
                    )
                    .onTapGesture {
                        withAnimation {
                            teamMatchesViewModel.changeSelection(selected: .calendar)
                        }
                    }
            }
            .font(.system(size: FontSizes.body, weight: .medium))
            .frame(width: 226, height: 42)
            .background(
                Rectangle()
                    .fill(redColor)
                    .frame(width: teamMatchesViewModel.selection == .results ? 109 : 122, height: 36, alignment: .leading)
                    .cornerRadius(25)
                    .offset(x: teamMatchesViewModel.selection == .results ? -55 : 48)
            )
        }
        .background(lightGrayColor)
        .cornerRadius(25)
    }
}

struct SelectionTabView_Preview: PreviewProvider {
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    static let teamModel = TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33)
    
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                MatchFilterTabView(teamMatchesViewModel: TeamMatchesViewModel(league: leagueModel, team: teamModel))
                Spacer()
            }
        }
    }
}
