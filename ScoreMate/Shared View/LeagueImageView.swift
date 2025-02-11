//
//  LeagueImageView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct LeagueImageView: View {
    let leagueId: Int
    
    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/soccer/leagues/100/\(leagueId).png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Image(systemName: "soccerball")
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
            
        }
    }
}

#Preview {
    LeagueImageView(leagueId: 974)
}
