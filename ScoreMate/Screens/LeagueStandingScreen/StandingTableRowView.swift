//
//  StandingTableRowView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct StandingTableRowView: View {
    var teamId: Int
    var index: Int
    var teamName: String
    var gamesPlayed: Int
    var goalsScored: Int
    var goalsAgainst: Int
    var points: Int
    
    var body: some View {
        HStack {
            Text("\(index+1).")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.08, alignment: .leading)
            
            AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/soccer/teams/100/\(teamId).png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Image("UnknownCountry")
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                }
                
            }
            .frame(width: 25, height: 25)
            
            Text(teamName)
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(gamesPlayed)")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
            
            Text("\(goalsScored)/\(goalsAgainst)")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.14, alignment: .center)
            
            Text("\(points)")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
        }
        .padding(.vertical, 4)
    }
}
