//
//  LeagueRowView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI
import FactoryKit

struct LeagueRowView: View {
    let leagueModel: LeagueModel
    @Injected(\.colors) private var colors: Colors

    init(leagueModel: LeagueModel) {
        self.leagueModel = leagueModel
    }
    
    var body: some View {
        HStack(spacing: Paddings.x3) {
            LeagueImageView(leagueId: leagueModel.id)
                .frame(width: 35, height: 35)
            
            Text(leagueModel.name)
                .font(.system(size: FontSizes.body, weight: .medium))
            
            Spacer()
            
            Image("chevronForward")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Paddings.x4)
        .padding(.vertical, Paddings.x3)
        .background(colors.cardBackground)
        .cornerRadius(Radii.medium)
        .shadow(color: colors.cardShadow, radius: 15, x: 0, y: 4)
    }
}
