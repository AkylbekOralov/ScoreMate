//
//  TamImageView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct TeamImageView: View {
    let teamId: Int
    
    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/soccer/teams/100/\(teamId).png")) { phase in
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
    }
}

#Preview {
    TeamImageView(teamId: 11)
}
