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
            
            AsyncImage(url: URL(string: leagueViewModel.countryImage ?? "")) { phase in
                if let image = phase.image {
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                } else if phase.error != nil {
                    Image("Unknown Country")
                } else {
                    ProgressView()
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
    static var sample = LeagueModel(id: 974, name: "A-League", country: "Australia", country_id: 99999999)
    
    static var leagueViewModel = LeagueViewModel(leagueModel: sample)
    
    static var previews: some View {
        LeagueView(leagueViewModel: leagueViewModel)
    }
}
