//
//  MatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct FinishedMatchView: View {
    let match: MatchModel
    let showDate: Bool
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: Paddings.x2) {
            HStack(spacing: Paddings.x1) {
                HStack(spacing: Paddings.x4) {
                    Text(match.homeTeamCode)
                        .font(.system(size: FontSizes.small))
                    TeamImageView(teamId: match.homeTeamId)
                        .frame(width: 41, height: 41)
                }
                Text("\(match.homeScore)-\(match.awayScore)")
                    .font(.system(size: FontSizes.body, weight: .medium))
                    .padding(.vertical, Paddings.x1)
                    .padding(.horizontal, Paddings.x2)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                    .cornerRadius(19)
                HStack(spacing: Paddings.x4) {
                    TeamImageView(teamId: match.awayTeamId)
                        .frame(width: 41, height: 41)
                    Text(match.awayTeamCode)
                        .font(.system(size: FontSizes.small))
                }
            }
            if showDate {
                Text(match.date)
                    .font(.system(size: FontSizes.small))
                    .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
            }
        }
        .matchCardStyle()
    }
}

struct FinishedMatchView_Preview: PreviewProvider {
    static let match = MatchModel(
        id: 1891183,
        statusName: "Finished",
        date: "2024-10-19",
        time: "18:00",
        homeTeam: "Auckland FC",
        homeTeamCode: "AUC",
        homeTeamId: 1931466026,
        homeScore: 2,
        awayTeam: "Brisbane Roar",
        awayTeamCode: "BRR",
        awayTeamId: 1105,
        awayScore: 0)
    
    static var previews: some View {
        FinishedMatchView(match: match, showDate: true)
    }
}
