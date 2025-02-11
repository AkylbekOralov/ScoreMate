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
            Text("\(index).")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.08, alignment: .leading)
            
            TeamImageView(teamId: teamId)
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
