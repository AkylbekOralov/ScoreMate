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
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: Paddings.x4) {
                HStack(spacing: Paddings.x4) {
                    Text(match.homeTeamCode)
                        .font(.system(size: FontSizes.small))
                    TeamImageView(teamId: match.homeTeamId)
                        .frame(width: 41, height: 41)
                }
                HStack(spacing: Paddings.x4) {
                    TeamImageView(teamId: match.awayTeamId)
                        .frame(width: 41, height: 41)
                    Text(match.awayTeamCode)
                        .font(.system(size: FontSizes.small))
                }
            }
            Text(match.date)
                .font(.system(size: FontSizes.small))
                .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                .padding(.top, Paddings.x2)
            Text(match.time)
                .font(.system(size: FontSizes.body, weight: .medium))
                .foregroundColor(.black)
                .padding(.top, Paddings.x1)
        }
        .matchCardStyle()
    }
}

//struct customModifier: ViewModifier {
//    func body(content: Content) -> some View {
//            content
//                .font(.largeTitle)
//                .foregroundStyle(.white)
//                .padding()
//                .background(.blue)
//                .clipShape(.rect(cornerRadius: 10))
//    }
//}

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

