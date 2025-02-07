//
//  StandingTableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueStandingView: View {
    
    @StateObject var standingTable: LeagueStandingViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    LeagueInfoView(leagueModel: standingTable.leagueModel)
                    Spacer()
                }
                
                LeagueTableView(standings: $standingTable.standings)
                
            }
            
            
        }
        
    }
    
}

struct LeagueStandingView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        LeagueStandingView(standingTable: LeagueStandingViewModel(leagueModel: leagueModel))
    }
    
}
