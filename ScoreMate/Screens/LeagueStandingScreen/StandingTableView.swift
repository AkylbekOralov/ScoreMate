//
//  StandingTableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct StandingTableView: View {
    
    @StateObject var standingTable: StandingTableViewModel
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    LeagueInfoView(leagueModel: standingTable.leagueModel)
                    Spacer()
                }
                
                TableView(standings: $standingTable.standings)
                
            }
            
            
        }
        
    }
    
}

struct StandingTableView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        StandingTableView(standingTable: StandingTableViewModel(leagueModel: leagueModel))
    }
    
}
