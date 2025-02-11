//
//  MatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct MatchView: View {
    
    let match: MatchModel
    
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
                        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading)
                }
                
                HStack {
                    TeamImageView(teamId: match.awayTeamId)
                    .frame(width: 25, height: 20)
                    
                    Text(match.awayTeam)
                        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading)
                }
            }
            
            VStack(spacing: 10) {
                Text(String(match.homeScore))
                Text(String(match.awayScore))
            }
            
            Spacer()
            
        }
    }
}

struct MatchView_Preview: PreviewProvider {
    
    static let match = MatchModel(
        id: 1891183,
        date: "2024-10-19",
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
