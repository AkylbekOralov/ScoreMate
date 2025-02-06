//
//  SwiftUIView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct TeamInfoView: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/countries/30/au.png")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownCountry")
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                        
                    }
                    .frame(width: 30, height: 30)
                    
                    Text("Australia")
                    
                }
                .padding(.leading, 15)
                
                HStack {
                    AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image("UnknownTeam")
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                        
                    }
                    .frame(width: 60, height: 60)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Auckland FC")
                            .font(.title2)
                    }
                    
                }
            }
            .padding(.leading, 15)
            Spacer()
            
        }
    }
}

#Preview {
    TeamInfoView()
}
