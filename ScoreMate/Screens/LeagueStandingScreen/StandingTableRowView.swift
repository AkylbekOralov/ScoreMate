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
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(index).")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: screenWidth * 0.08, alignment: .leading)
                .padding(.trailing, Paddings.x1)
            
            TeamImageView(teamId: teamId)
                .frame(width: 25, height: 25)
                .padding(.trailing, Paddings.x2)
            
            Text(teamName)
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, Paddings.x1)
            
            Text("\(gamesPlayed)")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: screenWidth * 0.06, alignment: .center)
                .padding(.trailing, Paddings.x2)
            
            Text("\(goalsScored)/\(goalsAgainst)")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: screenWidth * 0.14, alignment: .center)
                .padding(.trailing, Paddings.x2)
            
            Text("\(points)")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: screenWidth * 0.07, alignment: .center)
        }
        .font(.system(size: FontSizes.body, weight: .medium))
        .foregroundColor(.black)
    }
}

struct StandingTableRowView_Preview: PreviewProvider {
    static var previews: some View {
        VStack {
            StandingTableRowView(
                teamId: 1,
                index: 1,
                teamName: "Team Name",
                gamesPlayed: 19,
                goalsScored: 20,
                goalsAgainst: 11,
                points: 29
            )
            Spacer()
        }
        .padding(.horizontal, Paddings.x4)
    }
}
