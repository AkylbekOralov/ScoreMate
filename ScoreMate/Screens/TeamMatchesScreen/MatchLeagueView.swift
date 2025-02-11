//
//  MatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct MatchLeagueView: View {
    
    let league: LeagueModel
    let team: TeamModel
    
    var body: some View {
        HStack {
            Image(systemName: "soccerball.circle.fill.inverse")
                .resizable()
                .scaledToFit( )
                .frame(width: 40, height: 40)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("A-League")
                    .font(.headline)
                
                HStack {
                    CountryImageView(countryCode: league.countryCode)
                    .frame(width: 25, height: 20)
                    
                    Text("Australia")
                }
            }
            Spacer()
        }
        .padding(.vertical, 6)
        .background(.gray.opacity(0.3))
    }
}

struct MatchLeagueView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static let teamModel = TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33)
    
    static var previews: some View {
        MatchLeagueView(league: leagueModel, team: teamModel)
    }
}
