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
        HStack(spacing: 20) {
            CountryImageView(countryCode: leagueModel.countryCode)
                .frame(width: 30, height: 30)
            
            VStack(alignment: .leading) {
                Text(leagueModel.countryName)
                    .font(.caption)
                Text(leagueModel.name)
                    .font(.headline)
            }
        }
    }
}

struct LeagueView_Preview: PreviewProvider {
    static var sample = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        LeagueView(leagueModel: sample)
    }
}
