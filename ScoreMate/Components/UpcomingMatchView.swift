//
//  UpcomingMatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 20.02.2025.
//

import SwiftUI

struct UpcomingMatchView: View {
    let match: MatchModel
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    @ObservedObject private var colors = Colors.shared
    
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
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                .padding(.top, Paddings.x2)
            Text(match.time)
                .font(.system(size: FontSizes.body, weight: .medium))
                .padding(.top, Paddings.x1)
        }
        .padding(.horizontal, Paddings.x11)
        .padding(.vertical, Paddings.x3)
        .background(colors.cardBackground)
        .cornerRadius(Radii.medium)
        .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 4)
    }
}

struct UpcomingMatchView_Preview: PreviewProvider {
    static let match = MatchModel(
        id: 1891183,
        statusName: "Finished",
        date: "2024-10-19",
        time: "18:00",
        homeTeam: "Auckland FC",
        homeTeamCode: "AUC",
        homeTeamId: 1931466026,
        homeScore: 0,
        awayTeam: "Brisbane Roar",
        awayTeamCode: "BRR",
        awayTeamId: 1105,
        awayScore: 0)
    
    static var previews: some View {
        UpcomingMatchView(match: match)
    }
}

