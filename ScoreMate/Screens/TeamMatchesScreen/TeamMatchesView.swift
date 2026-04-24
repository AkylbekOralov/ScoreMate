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
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @Environment(\.colorScheme) private var colorScheme

    init(teamMatchesViewModel: TeamMatchesViewModel) {
        self._teamMatchesViewModel = StateObject(wrappedValue: teamMatchesViewModel)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: SmColors.teamMatchesScreenTop(theme: selectedTheme, systemColorScheme: colorScheme), location: 0.00),
                    Gradient.Stop(color: SmColors.appBackground.swiftUIColor, location: 0.35),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .ignoresSafeArea(.all)
            
            Button(action: {
                dismiss()
            }) {
                SmImages.backButton.swiftUIImage
                    .renderingMode(.template)
                    .foregroundStyle(SmColors.backButtonTint.swiftUIColor)
                    .padding(.leading, Paddings.x4)
                    .padding(.top, Paddings.x1)
            }
            .zIndex(1)
            
            VStack(spacing: 0) {
                TeamHeaderView(league: teamMatchesViewModel.league, team: teamMatchesViewModel.team)
                
                VStack {
                    MatchFilterTabView(teamMatchesViewModel: teamMatchesViewModel)
                }
                .padding(3)
                .background(SmColors.cardBackground(theme: selectedTheme, systemColorScheme: colorScheme))
                .cornerRadius(25)

                ScrollView {
                    VStack(spacing: Paddings.x4) {
                        ForEach(teamMatchesViewModel.displayedMatches) { match in
                            if teamMatchesViewModel.selection == .results {
                                LegacyFinishedMatchView(match: match, withDate: true)
                            } else {
                                LegacyUpcomingMatchView(match: match)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, Paddings.x8)
                }
            }
            .navigationBarBackButtonHidden(true)
            .gesture(
                DragGesture()
                    .onEnded { gesture in
                        if gesture.translation.width > 100 {
                            dismiss()
                        }
                    }
            )
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
