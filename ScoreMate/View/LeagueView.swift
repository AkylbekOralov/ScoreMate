//
//  LeagueView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueView: View {
    
    @StateObject var leagueViewModel: LeagueViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            
            AsyncImage(url: URL(string: leagueViewModel.country_img ?? "")) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40) // Adjust as needed
                } else if phase.error != nil {
                    Text("Failed to load image")
                        .foregroundColor(.red)
                } else {
                    ProgressView() // Show a loading indicator
                }
            }
            
            VStack(alignment: .leading) {
                Text(leagueViewModel.leagueModel.country)
                    .font(.caption)
                Text(leagueViewModel.leagueModel.name)
                    .font(.headline)
            }
        }
        
    }
}

struct LeagueView_Preview: PreviewProvider {
    static var sample = LeagueModel(id: 974, name: "A-League", country: "Australia", country_id: 14)
    
    static var leagueViewModel = LeagueViewModel(leagueModel: sample)
    
    static var previews: some View {
        LeagueView(leagueViewModel: leagueViewModel)
    }
}
