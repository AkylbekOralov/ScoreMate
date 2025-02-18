//
//  LeagueView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueView: View {
    let leagueModel: LeagueModel
    
    var body: some View {
        HStack(spacing: Paddings.x3) {
            LeagueImageView(leagueId: leagueModel.id)
                .frame(width: 35, height: 35)
                .padding(.trailing, Paddings.x3)
            Text(leagueModel.name)
                .font(.system(size: FontSizes.body, weight: .medium))
                .foregroundColor(.black)
            Spacer()
            Image("chevronForward")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Paddings.x4)
        .padding(.vertical, Paddings.x3)
        .background(.white)
        .cornerRadius(Radii.medium)
        .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 4)
    }
}

struct LeagueView_Preview: PreviewProvider {
    static var sample = LeagueModel(id: 974,
                                    name: "A-League",
                                    countryName: "Australia",
                                    countryId: 14, countryCode: "au",
                                    currentSeasonId: 14593)
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    static var previews: some View {
        VStack {
            LeagueView(leagueModel: sample)
        }
        .frame(maxWidth: screenWidth*0.9, maxHeight: .infinity, alignment: .top)
    }
}
