//
//  MainView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct MainView: View {
    @State var currentScreen: AppScreens = .leagues
    @State var leaguesViewModel = LeaguesViewModel()
    @State var mathesByDateViewModel = MatchesByDateViewModel()
    
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                VStack {
                    switch currentScreen {
                    case .leagues:
                        NavigationStack {
                            LeaguesView(leaguesViewModel: leaguesViewModel)
                        }
                    case .matchesByDate:
                        MatchesByDateView(mathesByDateViewModel: mathesByDateViewModel)
                    }
                }
                AppNavigationBarView(currentScreen: $currentScreen)
            }
        }
        .ignoresSafeArea(.all)
        .preferredColorScheme(.light)
    }
}

#Preview {
    MainView()
}
