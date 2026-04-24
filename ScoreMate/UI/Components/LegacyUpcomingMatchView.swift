//
//  LegacyUpcomingMatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 25.04.2026.
//

import SwiftUI

struct LegacyUpcomingMatchView: View {
    let match: MatchModel
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @Environment(\.colorScheme) private var colorScheme

    init(match: MatchModel) {
        self.match = match
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: Paddings.x4) {
                HStack(spacing: Paddings.x4) {
                    Text(match.homeTeamCode)
                        .font(.system(size: FontSizes.caption))
                    TeamImageView(teamId: match.homeTeamId)
                        .frame(width: 41, height: 41)
                }
                HStack(spacing: Paddings.x4) {
                    TeamImageView(teamId: match.awayTeamId)
                        .frame(width: 41, height: 41)
                    Text(match.awayTeamCode)
                        .font(.system(size: FontSizes.caption))
                }
            }
            Text(match.date)
                .font(.system(size: FontSizes.caption))
                .foregroundColor(SmColors.inactiveText.swiftUIColor)
                .padding(.top, Paddings.x2)
            Text(match.time)
                .font(.system(size: FontSizes.body, weight: .medium))
                .padding(.top, Paddings.x1)
        }
        .padding(.horizontal, Paddings.x11)
        .padding(.vertical, Paddings.x3)
        .background(SmColors.cardBackground(theme: selectedTheme, systemColorScheme: colorScheme))
        .cornerRadius(Radii.medium)
        .shadow(color: SmColors.cardShadow.swiftUIColor, radius: 15, x: 0, y: 4)
    }
}

struct LegacyUpcomingMatchView_Preview: PreviewProvider {
    static let match = MatchModel(
        id: 1891183,
        statusName: "Finished",
        date: "2024-10-19",
        time: "18:00",
        leagueName: "A-League",
        leagueCountryName: "Australia",
        groupName: "A-League 24/25",
        stageName: "Regular Season - A-League 24/25",
        roundName: "8",
        homeTeam: "Auckland FC",
        homeTeamCode: "AUC",
        homeTeamId: 1931466026,
        homeScore: 0,
        awayTeam: "Brisbane Roar",
        awayTeamCode: "BRR",
        awayTeamId: 1105,
        awayScore: 0
    )
    
    static var previews: some View {
        LegacyUpcomingMatchView(match: match)
    }
}
