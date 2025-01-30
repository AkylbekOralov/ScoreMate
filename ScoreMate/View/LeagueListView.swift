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
        NavigationStack {
            List {
                ForEach(viewModel.leagues) { league in
                    NavigationLink {
                        Text(league.name)
                    } label: {
                        LeagueView(leagueViewModel: LeagueViewModel(leagueModel: league))
                    }
                }
                
            }
            .navigationTitle(Text("Leagues"))
        }
    }
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeagueListView(viewModel: LeagueListViewModel())
    }
}
