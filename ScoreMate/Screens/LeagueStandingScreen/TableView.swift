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
                Text("#")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .frame(width: UIScreen.main.bounds.width * 0.08, alignment: .leading)
                Text("Team")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("M")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
                Text("GS/GA")
                    .font(.system(size: 18, weight: .regular, design: .default))
                    .frame(width: UIScreen.main.bounds.width * 0.14, alignment: .center)
                Text("P")
                    .font(.system(size: 20, weight: .regular, design: .default))
                    .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
                
            }
            .background(Color.gray.opacity(0.3))
            .padding(.bottom, 5)
            
            
            ScrollView {
                VStack {
                    ForEach(Array(standings.enumerated()), id: \.element.id) { index, team in
                        HStack {
                            Text("\(index + 1).")
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .frame(width: UIScreen.main.bounds.width * 0.08, alignment: .leading)
                                
                            Text(team.name)
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(team.gamesPlayed)")
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
                            
                            Text("\(team.goalsScored)/\(team.goalsAgainst)")
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .frame(width: UIScreen.main.bounds.width * 0.14, alignment: .center)
                                
                            Text("\(team.points)")
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
                        }
                        .padding(.vertical, 4)
                    }
                    
                }
            }
        
        }
        .padding()
        
    }
}

struct TableView_Preview: PreviewProvider {
    
    static let leagueModel = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14, countryCode: "au", currentSeasonId: 14593)
    
    static var previews: some View {
        TableView(standings: .constant(StandingTableViewModel(leagueModel: leagueModel).standings))
    }
    
}
