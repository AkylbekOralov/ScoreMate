//
//  TableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 03.02.2025.
//

import SwiftUI

struct TableView: View {
    
    @Binding var standings: [TeamModel]
    
    var body: some View {
        VStack  {
            
            HStack {
                Text("#").bold()
                Text("Team").bold()
                Text("M").bold()
                Text("GS/GA").bold()
                Text("P").bold()
            }
            
            
            ScrollView {
                VStack {
                    ForEach(Array(standings.enumerated()), id: \.element.id) { index, team in
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
                                .font(.system(size: 15, weight: .medium, design: .default)) 
                            
                            
                            Text("\(team.gamesPlayed)")
                                .frame(width: 30, alignment: .center)
                                .minimumScaleFactor(0.5)
                            
                            Text("\(team.goalsScored)/\(team.goalsAgainst)")
                                .frame(width: 50, alignment: .center)
                            
                            Text("\(team.points)")
                                .frame(width: 30, alignment: .trailing)
                        }
                        .padding(.vertical, 4)
                        
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding(.horizontal, 8)
        }
    }
}

struct TableView_Preview: PreviewProvider {
    
    static let standingTable = StandingTableViewModel()
    
    static var previews: some View {
        TableView(standings: .constant(StandingTableViewModel().standings))
    }
    
}
