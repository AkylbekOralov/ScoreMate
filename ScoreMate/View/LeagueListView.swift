//
//  LeagueListView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueListView: View {
    
    @StateObject var viewModel: LeagueListViewModel
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(viewModel.leagues) { league in
                    NavigationLink {
                        Text(league.name)
                    } label: {
                        LeagueView(country: league.country, league: league.name)
                    }
                }
                
            }
            .navigationTitle(Text("Leagues"))
        }
    }
}


struct LeagueView: View {
    var country: String = ""
    var league: String = ""
    
    var body: some View {
        HStack(spacing: 20) {
            Image(country)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                
            VStack(alignment: .leading) {
                Text(country)
                    .font(.caption)
                Text(league)
                    .font(.headline)
            }
        }
        
    }
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeagueListView(viewModel: LeagueListViewModel())
    }
}
