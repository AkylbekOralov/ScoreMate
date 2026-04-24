//
//  TamImageView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct TeamImageView: View {
    let teamId: Int
    private let apiEndpoints: APIEndpointsProviding = APIEndpoints()
    
    var body: some View {
        AsyncImage(url: apiEndpoints.teamImage(teamId: teamId)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                SmImages.unknownTeam.swiftUIImage
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
            
        }
    }
}

#Preview {
    TeamImageView(teamId: 1)
}
