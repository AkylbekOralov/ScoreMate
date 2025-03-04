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

struct MainView: View {
    @State var currentScreen: Screens = .leagues
    @State var viewModel = LeaguesViewModel()
    @State var recentMathesViewModel = MathesByDateViewModel()
    
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                VStack {
                    switch currentScreen {
                    case .leagues:
                        NavigationStack {
                            LeaguesView(viewModel: viewModel)
                            MathesByDateView(mathesByDateViewModel: recentMathesViewModel)
                        }
                    case .matches:
                        MathesByDateView(mathesByDateViewModel: recentMathesViewModel)
                    }
                }
                AppNavigationBarView(currentScreen: $currentScreen)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MainView()
}
