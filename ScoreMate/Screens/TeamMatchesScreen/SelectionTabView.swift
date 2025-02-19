//
//  SelectionTabView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct SelectionTabView: View {
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    var grayColor = Color(red: 0.44, green: 0.44, blue: 0.44)
    var lightGrayColor = Color(red: 0.96, green: 0.96, blue: 0.96)
    var redColor = Color(red: 0.8, green: 0.18, blue: 0.17)
    
    var body: some View {
        ZStack {
            HStack {
                Text("Results")
                    .foregroundColor(teamMatchesViewModel.selection == .results ? .white : grayColor)
                    .background(.red)
                    .onTapGesture {
                        teamMatchesViewModel.changeSelection(selected: .results)
                    }
                
                Text("Calendar")
                    .foregroundColor(teamMatchesViewModel.selection == .calendar ? .white : grayColor)
                    .onTapGesture {
                        teamMatchesViewModel.changeSelection(selected: .calendar)
                    }
                
            }
        }
    }
}

struct SelectionTabView_Preview: PreviewProvider {
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    static let teamModel = TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33)
    
    static var previews: some View {
        ZStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.88, green: 0.91, blue: 0.93), location: 0.00),
                    Gradient.Stop(color: .white, location: 0.35),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea()
            
            SelectionTabView(teamMatchesViewModel: TeamMatchesViewModel(league: leagueModel, team: teamModel))
        }
    }
}
