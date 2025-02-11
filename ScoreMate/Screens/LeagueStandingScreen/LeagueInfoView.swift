//
//  LeagueInfoView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueInfoView: View {
    
    let leagueModel: LeagueModel
    
    var body: some View {
        VStack  {
            VStack (alignment: .leading) {
                HStack {
                    LeagueImageView(leagueId: leagueModel.id)
                        .frame(width: 70, height: 70)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text(leagueModel.name)
                            .font(.title)
                        Text("2024/2025")
                            .font(.body)
                    }
                    
                }
                
                HStack {
                    CountryImageView(countryCode: leagueModel.countryCode)
                        .frame(width: 30, height: 30)
                    
                    Text(leagueModel.countryName)
                        .padding(Paddings.small)
                }
                .padding(.leading, 10)
            }
        }
        .padding(20)
    }
}

struct LeagueInfoView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        LeagueInfoView(leagueModel: leagueModel)
    }
    
}

