//
//  MatchView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        HStack {
            Text("24.01")
                .padding(.leading, 20)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownTeam")
                        } else {
//                            ProgressView()
                            Image("Australia")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    .frame(width: 25, height: 20)
                    
                    Text("Auckland FC")
                        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading)
                }
                
                HStack {
                    AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/soccer/teams/80/1105.png")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownTeam")
                        } else {
//                            ProgressView()
                            Image("Australia")
                                .resizable()
                                .scaledToFit()
                        }
                        
                    }
                    .frame(width: 25, height: 20)
                    
                    Text("Brisbane Roar")
                        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading)
                }
            }
            
            VStack(spacing: 10) {
                Text("2")
                Text("0")
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    MatchView()
}
