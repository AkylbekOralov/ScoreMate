//
//  CountryImageView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct CountryImageView: View {
    let countryCode: String
    
    var body: some View {
        AsyncImage(url: URL(string: "https://cdn.soccersapi.com/images/countries/30/\(countryCode).png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Radii.small)
            } else if phase.error != nil {
                Image("UnknownCountry")
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
