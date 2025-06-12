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
    var teamViewModel: TeamMatchesViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(index).")
                .font(.system(size: FontSizes.body, weight: .medium, design: .default))
                .frame(width: 25, alignment: .leading)
                .padding(.trailing, Paddings.x1)
            
            NavigationLink(destination: TeamMatchesView(teamMatchesViewModel: teamViewModel)) {
                TeamImageView(teamId: teamId)
                    .frame(width: 25, height: 25)
                    .padding(.trailing, Paddings.x2)
                
                Text(teamName)
                    .font(.system(size: FontSizes.body, weight: .medium, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
            }
                
            Text("\(gamesPlayed)")
                .font(.system(size: FontSizes.body, weight: .medium, design: .default))
                .frame(width: 25, alignment: .center)
                .padding(.trailing, Paddings.x2)
            
            Text("\(goalsScored)/\(goalsAgainst)")
                .font(.system(size: FontSizes.body, weight: .medium, design: .default))
                .frame(width: 54, alignment: .center)
                .padding(.trailing, Paddings.x2)
            
            Text("\(points)")
                .font(.system(size: FontSizes.body, weight: .medium, design: .default))
                .frame(width: 25, alignment: .center)
        }
    }
}
