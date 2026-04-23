//
//  LeagueHeaderView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI
import FactoryKit

struct LeagueHeaderView: View {
    let leagueModel: LeagueModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    @Injected(\.colors) private var colors: Colors
    
    var body: some View {
        VStack(spacing: Paddings.x2) {
            LeagueImageView(leagueId: leagueModel.id)
                .frame(width: 107, height: 107)
            
            Text(leagueModel.name)
                .font(.system(size: FontSizes.title1, weight: .medium))
                .foregroundColor(colors.inverseText)
        }
        .padding(.bottom, Paddings.x4)
    }
}
