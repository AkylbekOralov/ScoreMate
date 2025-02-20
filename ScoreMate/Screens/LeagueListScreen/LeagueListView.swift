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
                VStack(spacing: 0) {
                    headerView()
                    
                    VStack {
                        if viewModel.loading {
                            JumpingBallView()
                            Spacer()
                        } else {
                            LeaguesScrollView(leagues: viewModel.leagues)
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
            .background(Colors.lightBackground)
        }
        
    }
}

private extension LeagueListView {
    func headerView() -> some View {
        VStack {
            Text("Football Leagues")
                .font(.system(size: FontSizes.large, weight: .bold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, Paddings.x13)
        .padding(.bottom, Paddings.x8)
    }
    
    
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeagueListView(viewModel: LeagueListViewModel())
    }
}
