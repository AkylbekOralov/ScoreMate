//
//  LeagueInfoView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueInfoView: View {
    
    var body: some View {
        VStack  {
            VStack (alignment: .leading) {
                HStack {
                    Image("UnknownCountry")
                        .cornerRadius(3)
                    Text("Australia")
                }
                .padding(.leading, 10)
                .padding(.bottom, 10)
                
                HStack {
                    Image(systemName: "soccerball")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("A-League")
                            .font(.title)
                        Text("2024/2025")
                            .font(.body)
                    }
                    
                }
            }
        }
        .padding(20)
    }
}

struct LeagueInfoView_Preview: PreviewProvider {
    
    static var previews: some View {
        LeagueInfoView()
    }
    
}

