//
//  LeaguesScrollView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 20.02.2025.
//

import SwiftUI

struct LeaguesListView: View {
    let leagues: [LeagueModel]
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: Paddings.x6) {
                ForEach(leagues) { league in
                    leagueItemView(league: league)
                }
            }
        }
    }
}

extension LeaguesListView {
    func leagueItemView(league: LeagueModel) -> some View {
        VStack {
            HStack(spacing: Paddings.x2) {
                CountryImageView(countryCode: league.countryCode)
                    .frame(width: 35, height: 35)
                Text(league.countryName)
                    .font(.system(size: FontSizes.small, weight: .light))
                    .foregroundColor(Colors.darkText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, Paddings.x2)
            
            NavigationLink {
                LeagueStandingView(leagueStandingViewModel: LeagueStandingViewModel(leagueModel: league))
            } label: {
                VStack {
                    LeagueRowView(leagueModel: league)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
