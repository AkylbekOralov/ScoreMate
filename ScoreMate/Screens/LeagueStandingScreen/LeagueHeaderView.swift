//
//  LeagueInfoView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueHeaderView: View {
    let leagueModel: LeagueModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(spacing: Paddings.x2) {
            LeagueImageView(leagueId: leagueModel.id)
                .frame(width: 107, height: 107)
            
            Text(leagueModel.name)
                .font(.system(size: FontSizes.title1, weight: .medium))
                .foregroundColor(Colors.lightText)
        }
        .padding(.bottom, Paddings.x4)
    }
}

struct LeagueInfoView_Preview: PreviewProvider {
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        ZStack(alignment: .top) {
            Color.gray
                .ignoresSafeArea()
            LeagueHeaderView(leagueModel: leagueModel)
        }
    }
}

