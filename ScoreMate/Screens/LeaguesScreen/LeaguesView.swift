//
//  LeaguesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeaguesView: View {
    @ObservedObject var leaguesViewModel: LeaguesViewModel
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 0) {
                    headerView()
                    
                    VStack {
                        if let errorMessage = leaguesViewModel.errorMessage {
                            errorView(errorMessage: errorMessage)
                        } else {
                            LeaguesListView(leagues: leaguesViewModel.leagues)
                        }
                    }
                }
                .padding(.horizontal, Paddings.x3)
                Spacer()
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
        }
    }
}

private extension LeaguesView {
    func headerView() -> some View {
        VStack {
            Text("Football Leagues")
                .font(.system(size: FontSizes.title2, weight: .bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, Paddings.x13)
        .padding(.bottom, Paddings.x8)
    }
    
    func errorView(errorMessage: String) -> some View {
        VStack(spacing: Paddings.x4) {
            Text(errorMessage)
                .foregroundColor(.red)
                .multilineTextAlignment(.leading)
            
            Button(action: {
                leaguesViewModel.fetchLeagues()
            }) {
                Text("Retry")
                    .font(.system(size: 18, weight: .bold))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(alignment: .leading)
    }
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeaguesView(leaguesViewModel: LeaguesViewModel())
    }
}
