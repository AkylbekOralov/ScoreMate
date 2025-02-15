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

struct MainScreenView: View {
    @State var currentScreen: Screens = .leagues
    @State var viewModel = LeagueListViewModel()
    @State var recentMathesViewModel = RecentMathesViewModel()
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                VStack {
                    switch currentScreen {
                    case .leagues:
                        LeagueListView(viewModel: viewModel)
                    case .matches:
                        RecentMathesView(recentMathesViewModel: recentMathesViewModel)
                    }
                }
                .frame(maxHeight: .infinity)
                NavBarView(currentScreen: $currentScreen)
            }
        }
    }
}

#Preview {
    MainScreenView()
}
