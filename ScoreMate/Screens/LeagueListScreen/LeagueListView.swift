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
            if viewModel.loading {
                ProgressView()
            } else {
                HStack {
                    VStack (alignment: .leading) {
                        ForEach(viewModel.leagues) { league in
                            NavigationLink {
                                LeagueStandingView(leagueStandingViewModel: LeagueStandingViewModel(leagueModel: league))
                            } label: {
                                LeagueView(leagueModel: league)
                            }
                        }
                    }
                    .padding(.leading, Paddings.large)
                    Spacer()
                }
                .navigationTitle(Text("Leagues"))
                Spacer()
            }
        }
        
    }
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeagueListView(viewModel: LeagueListViewModel())
    }
}
