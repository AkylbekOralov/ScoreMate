//
//  LeagueListView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueListView: View {
    @StateObject var viewModel: LeagueListViewModel
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    if viewModel.loading {
                        JumpingBallView()
                        Spacer()
                    } else {
                        VStack (alignment: .leading, spacing: 2) {
                            ForEach(viewModel.leagues) { league in
                                NavigationLink {
                                    LeagueStandingView(leagueStandingViewModel: LeagueStandingViewModel(leagueModel: league))
                                } label: {
                                    VStack {
                                        LeagueView(leagueModel: league)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, screenWidth*0.1)
                                    .padding(.vertical, 5)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                        
                        
                    }
                }
                .padding(.top, screenWidth*0.1)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment:.topLeading
            )
            .navigationTitle("Leagues")
        }
        
    }
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeagueListView(viewModel: LeagueListViewModel())
    }
}
