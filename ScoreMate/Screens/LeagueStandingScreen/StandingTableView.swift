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
                    LeagueInfoView()
                    Spacer()
                }
                
                TableView(standings: $standingTable.standings)
                
            }
            
            
        }
        
    }
    
}

struct StandingTableView_Preview: PreviewProvider {
    
    static var previews: some View {
        StandingTableView(standingTable: StandingTableViewModel())
    }
    
}
