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
                
                List(Array(standingTable.standings.enumerated()), id: \.element.id) { index, team in
                    HStack {
                        Text("\(index + 1).")
                            .frame(width: 30, alignment: .center)
                            .padding(.vertical, 3)
                            .background(
                                index+1 < 4 ? Color.accentColor : Color.clear
                            )
                            .cornerRadius(4)

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
                .listStyle(PlainListStyle())

                
                
            }
            
            
        }
        
    }
    
}

struct StandingTableView_Preview: PreviewProvider {
    
    static var previews: some View {
        StandingTableView(standingTable: StandingTableViewModel())
    }
    
}
