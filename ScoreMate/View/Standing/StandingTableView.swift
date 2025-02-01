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
                
                List(standingTable.standings) { team in
                    HStack {
                        Text(team.name)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(team.gamesPlayed)")
                            .frame(width: 30, alignment: .center)
                        
                        Text("\(team.goalsScored)/\(team.goalsAgainst)")
                            .frame(width: 50, alignment: .center)
                        
                        Text("\(team.points)")
                            .frame(width: 30, alignment: .trailing)
                    }
                    .padding(.vertical, 4)
                }

                
                
            }
            
            
        }
        
    }
    
}

struct StandingTableView_Preview: PreviewProvider {
    
    static var previews: some View {
        StandingTableView(standingTable: StandingTableViewModel())
    }
    
}
