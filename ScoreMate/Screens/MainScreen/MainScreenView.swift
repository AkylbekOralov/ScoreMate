//
//  MainScreen.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

enum Screens {
    case leagues
    case matches
}

enum LeaguesScreen {
    case leagueLists, leagueStandings(model: LeagueModel), teamMatches
}

enum MatchesScreen {
    case selectedDate, matchesList, matchStatistics
}

struct MainScreenView: View {
    @State var currentScreen: Screens = .leagues
    @State var viewModel = LeagueListViewModel()
    @State var recentMathesViewModel = RecentMathesViewModel()
    
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                VStack {
                    switch currentScreen { // TODO: Switch between enums
                    case .leagues: // FIXME:
                        LeagueListView(viewModel: viewModel)
                    case .matches:
                        RecentMathesView(recentMathesViewModel: recentMathesViewModel)
                    }
                }
                NavBarView(currentScreen: $currentScreen)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MainScreenView()
}
