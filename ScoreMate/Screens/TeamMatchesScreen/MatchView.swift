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
                    AsyncImage(url: URL(string: match.homeTeamImage)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownTeam")
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                        
                    }
                    .frame(width: 25, height: 20)
                    
                    Text(match.homeTeam)
                        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading)
                }
                
                HStack {
                    AsyncImage(url: URL(string: match.awayTeamImage)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownTeam")
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                        
                    }
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
        homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
        homeScore: 2,
        awayTeam: "Brisbane Roar",
        awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1105.png",
        awayScore: 0)
    
    static var previews: some View {
        MatchView(match: match)
    }
}
