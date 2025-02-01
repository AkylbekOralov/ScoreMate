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
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 40, height: 40)
                    
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                case .failure:
                    Image("UnknownCountry")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                @unknown default:
                    EmptyView()
                }
            }
        
            VStack(alignment: .leading) {
                Text(leagueViewModel.leagueModel.countryName)
                    .font(.caption)
                Text(leagueViewModel.leagueModel.name)
                    .font(.headline)
            }
        }
    }
}

struct LeagueView_Preview: PreviewProvider {
    static var sample = LeagueModel(id: 974, name: "A-League", countryName: "Australia", countryId: 14)
    
    static var leagueViewModel = LeagueViewModel(leagueModel: sample)
    
    static var previews: some View {
        LeagueView(leagueViewModel: leagueViewModel)
    }
}
