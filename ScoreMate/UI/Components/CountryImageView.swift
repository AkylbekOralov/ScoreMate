//
//  CountryImageView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct CountryImageView: View {
    let countryCode: String
    private let apiEndpoints: APIEndpointsProviding = APIEndpoints()
    
    var body: some View {
        AsyncImage(url: apiEndpoints.countryImage(countryCode: countryCode)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Radii.small)
            } else if phase.error != nil {
                SmImages.unknownCountry.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Radii.small)
            } else {
                ProgressView()
            }
            
        }
    }
}

#Preview {
    CountryImageView(countryCode: "au")
}
