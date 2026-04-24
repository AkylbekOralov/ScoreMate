//
//  MatchFilterTabView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct MatchFilterTabView: View {
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @Environment(\.colorScheme) private var colorScheme

    init(teamMatchesViewModel: TeamMatchesViewModel) {
        self._teamMatchesViewModel = StateObject(wrappedValue: teamMatchesViewModel)
    }
    
    var body: some View {
        VStack {
            HStack(spacing: Paddings.x11) {
                Text("Results")
                    .foregroundColor(teamMatchesViewModel.selection == .results ? SmColors.inverseText.swiftUIColor : SmColors.inactiveText.swiftUIColor)
                    .animation(
                        Animation.easeInOut(duration: 0.2)
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            teamMatchesViewModel.changeSelection(selected: .results)
                        }
                    }
                
                Text("Calendar")
                    .foregroundColor(teamMatchesViewModel.selection == .calendar ? SmColors.inverseText.swiftUIColor : SmColors.inactiveText.swiftUIColor)
                    .animation(
                        Animation.easeInOut(duration: 0.2)
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            teamMatchesViewModel.changeSelection(selected: .calendar)
                        }
                    }
            }
            .font(.system(size: FontSizes.body, weight: .medium))
            .frame(width: 226, height: 42)
            .background(
                Rectangle()
                    .fill(SmColors.selectionAccent.swiftUIColor)
                    .frame(width: teamMatchesViewModel.selection == .results ? 109 : 122, height: 36, alignment: .leading)
                    .cornerRadius(25)
                    .offset(x: teamMatchesViewModel.selection == .results ? -55 : 48)
            )
        }
        .background(SmColors.selectorBackground(theme: selectedTheme, systemColorScheme: colorScheme))
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
