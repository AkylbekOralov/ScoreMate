//
//  LeagueInfoView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueInfoView: View {
    let leagueModel: LeagueModel
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .white, location: 0.00),
                    Gradient.Stop(color: Color(red: 1, green: 0.45, blue: 0.21), location: 0.75),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .frame(height: screenHeight*0.3)
            .ignoresSafeArea()
            
            VStack(spacing: Paddings.x2) {
                LeagueImageView(leagueId: leagueModel.id)
                    .frame(width: 107, height: 107)
                
                Text(leagueModel.name)
                    .font(.system(size: FontSizes.extraLarge, weight: .medium))
                    .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct LeagueInfoView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        VStack {
            LeagueInfoView(leagueModel: leagueModel)
            Spacer()
        }
    }
    
}

