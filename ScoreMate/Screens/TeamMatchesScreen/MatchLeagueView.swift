//
//  MatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct MatchLeagueView: View {
    var body: some View {
        HStack {
            
            Image(systemName: "soccerball.circle.fill.inverse")
                .resizable()
                .scaledToFit( )
                .frame(width: 40, height: 40)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("A-League")
                    .font(.headline)
                
                HStack {
                    AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/countries/30/au.png")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownCountry")
                        } else {
//                            ProgressView()
                            Image("Australia")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    .frame(width: 25, height: 20)
                    
                    Text("Australia")
                }
            }
            Spacer()
        }
        .padding(.vertical, 6)
        .background(.gray.opacity(0.3))
    }
}

#Preview {
    MatchLeagueView()
}
