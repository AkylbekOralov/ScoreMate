//
//  MatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct MatchView: View {
    let match: MatchModel
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            Text(match.date)
                .padding(.leading, 20)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    TeamImageView(teamId: match.homeTeamId)
                    .frame(width: 25, height: 20)
                    
                    Text(match.homeTeam)
                        .frame(width: screenWidth * 0.4, alignment: .leading)
                }
                
                HStack {
                    TeamImageView(teamId: match.awayTeamId)
                    .frame(width: 25, height: 20)
                    
                    Text(match.awayTeam)
                        .frame(width: screenWidth * 0.4, alignment: .leading)
                }
            }
            
            if match.statusName == "Finished" {
                VStack(spacing: 10) {
                    Text(String(match.homeScore))
                    Text(String(match.awayScore))
                }
            } else {
                Text(match.time)
            }
            
            
            Spacer()
            
        }
    }
}

struct MatchView_Preview: PreviewProvider {
    static let match = MatchModel(
        id: 1891183,
        statusName: "Finished",
        date: "2024-10-19",
        time: "18:00",
        homeTeam: "Auckland FC",
        homeTeamId: 1931466026,
        homeScore: 2,
        awayTeam: "Brisbane Roar",
        awayTeamId: 1105,
        awayScore: 0)
    
    static var previews: some View {
        MatchView(match: match)
    }
}
