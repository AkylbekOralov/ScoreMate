//
//  LeagueView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueView: View {
    
    var leagueModel: LeagueModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(leagueModel.country)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                
            VStack(alignment: .leading) {
                Text(leagueModel.country)
                    .font(.caption)
                Text(leagueModel.name)
                    .font(.headline)
            }
        }
        
    }
}

struct LeagueView_Preview: PreviewProvider {
    static var sample = LeagueModel(id: 974, name: "A-League", country: "Australia", country_id: 14)
    
    static var previews: some View {
        LeagueView(leagueModel: sample)
    }
}
