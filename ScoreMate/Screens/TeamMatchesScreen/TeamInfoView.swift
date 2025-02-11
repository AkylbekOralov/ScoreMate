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
        HStack {
            VStack (alignment: .leading) {
                HStack {
                    CountryImageView(countryCode: league.countryCode)
                        .frame(width: 30, height: 30)
                    
                    Text(league.countryName)
                    
                }
                .padding(.leading, 15)
                
                HStack {
                    TeamImageView(teamId: team.id)
                        .frame(width: 60, height: 60)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text(team.name)
                            .font(.title2)
                    }
                    
                }
            }
            .padding(.leading, 15)
            Spacer()
            
        }
    }
}

struct TeamInfoView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static let teamModel = TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33)
    
    static var previews: some View {
        TeamInfoView(league: leagueModel, team: teamModel)
    }
}
