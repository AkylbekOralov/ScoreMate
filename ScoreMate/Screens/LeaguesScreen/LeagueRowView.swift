//
//  LeagueRowView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueRowView: View {
    let leagueModel: LeagueModel
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @Environment(\.colorScheme) private var colorScheme

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
            
            SmImages.chevronForward.swiftUIImage
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Paddings.x4)
        .padding(.vertical, Paddings.x3)
        .background(SmColors.cardBackground(theme: selectedTheme, systemColorScheme: colorScheme))
        .cornerRadius(Radii.medium)
        .shadow(color: SmColors.cardShadow.swiftUIColor, radius: 15, x: 0, y: 4)
    }
}
