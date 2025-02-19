//
//  SwiftUIView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct TeamInfoView: View {
    let league: LeagueModel
    let team: TeamModel
    
    var body: some View {
        VStack(spacing: 0) {
            TeamImageView(teamId: team.id)
                .frame(width: 83, height: 83)
                .padding(.bottom, Paddings.x5)
            
            Text(team.name)
                .font(.system(size: FontSizes.body, weight: .semibold))
                .foregroundColor(.black)
                .padding(.bottom, Paddings.x2)
            
            Text("\(league.countryName) \(league.name)")
                .font(.system(size: FontSizes.extraSmall))
                .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
        }
        .padding(.top, Paddings.x8)
        .padding(.bottom, Paddings.x4)
    }
}

struct TeamInfoView_Preview: PreviewProvider {
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    static let teamModel = TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33)
    
    static var previews: some View {
        VStack {
            TeamInfoView(league: leagueModel, team: teamModel)
            Spacer()
        }
    }
}
