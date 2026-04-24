//
//  FinishedMatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct FinishedMatchView: View {
    let match: MatchModel
    let withDate: Bool
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @Environment(\.colorScheme) private var colorScheme

    init(match: MatchModel, withDate: Bool) {
        self.match = match
        self.withDate = withDate
    }

    private var competitionLabel: String {
        "\(match.leagueCountryName) • \(match.leagueName)"
    }

    private var matchContextLabel: String {
        "\(match.roundName) • \(match.stageName)"
    }
    
    var body: some View {
        VStack(spacing: Paddings.x3) {
            Text(competitionLabel)
                .font(.system(size: FontSizes.caption))
                .foregroundColor(SmColors.inactiveText.swiftUIColor)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: Paddings.x2) {
                teamColumn(
                    code: match.homeTeamCode,
                    name: match.homeTeam,
                    teamId: match.homeTeamId
                )

                Text("\(match.homeScore)-\(match.awayScore)")
                    .font(.system(size: FontSizes.body, weight: .semibold))
                    .padding(.vertical, Paddings.x1)
                    .padding(.horizontal, Paddings.x2)
                    .background(Color(.systemGray5))
                    .cornerRadius(19)

                teamColumn(
                    code: match.awayTeamCode,
                    name: match.awayTeam,
                    teamId: match.awayTeamId
                )
            }

            HStack {
                Text(matchContextLabel)
                Spacer()
                if withDate {
                    Text(match.date)
                }
            }
            .font(.system(size: FontSizes.caption))
            .foregroundColor(SmColors.inactiveText.swiftUIColor)
        }
        .padding(.horizontal, Paddings.x11)
        .padding(.vertical, Paddings.x3)
        .background(SmColors.cardBackground(theme: selectedTheme, systemColorScheme: colorScheme))
        .cornerRadius(Radii.medium)
        .shadow(color: SmColors.cardShadow.swiftUIColor, radius: 15, x: 0, y: 4)
        .fixedSize(horizontal: false, vertical: true)
    }

    private func teamColumn(code: String, name: String, teamId: Int) -> some View {
        VStack(spacing: Paddings.x1) {
            TeamImageView(teamId: teamId)
                .frame(width: 41, height: 41)
            Text(code)
                .font(.system(size: FontSizes.caption, weight: .medium))
            Text(name)
                .font(.system(size: FontSizes.caption))
                .foregroundColor(SmColors.inactiveText.swiftUIColor)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FinishedMatchView_Preview: PreviewProvider {
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
        homeScore: 2,
        awayTeam: "Brisbane Roar",
        awayTeamCode: "BRR",
        awayTeamId: 1105,
        awayScore: 0)
    
    static var previews: some View {
        ZStack {
            FinishedMatchView(match: match, withDate: true)
        }
        .preferredColorScheme(.dark)
        
    }
}
