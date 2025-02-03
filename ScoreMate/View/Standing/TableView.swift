//
//  TableView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 03.02.2025.
//

import SwiftUI

struct TableView: View {
    let columns: [GridItem] = [
        GridItem(.fixed(30), alignment: .center),  // #
        GridItem(.flexible(), alignment: .leading), // Team
        GridItem(.fixed(30), alignment: .center),  // M
        GridItem(.fixed(50), alignment: .center),  // GS/GA
        GridItem(.fixed(30), alignment: .trailing) // P
    ]
    
    @Binding var standings: [TeamModel]
    
    var body: some View {
        VStack  {
            LazyVGrid(columns: columns, spacing: 8) {
                Text("#").bold()
                Text("Team").bold()
                Text("M").bold()
                Text("GS/GA").bold()
                Text("P").bold()
            }
            .padding(.vertical, 4)
            .background(Color.gray.opacity(0.2))
            
            
            List(Array(standings.enumerated()), id: \.element.id) { index, team in
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

struct TableView_Preview: PreviewProvider {
    
    static let standingTable = StandingTableViewModel()
    
    static var previews: some View {
        TableView(standings: .constant(StandingTableViewModel().standings))
    }
    
}
