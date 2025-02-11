//
//  StandingTableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueStandingView: View {
    
    @StateObject var leagueStandingViewModel: LeagueStandingViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    LeagueInfoView(leagueModel: leagueStandingViewModel.leagueModel)
                    Spacer()
                }
                LeagueTableView(leagueStandingViewModel: leagueStandingViewModel)
            }
        }
    }
}

struct LeagueStandingView_Preview: PreviewProvider {
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        LeagueStandingView(leagueStandingViewModel: LeagueStandingViewModel(leagueModel: leagueModel))
    }
}
