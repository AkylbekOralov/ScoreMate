//
//  MainView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct MainView: View {
    @State var leaguesViewModel = LeaguesViewModel()
    @State var mathesByDateViewModel = MatchesByDateViewModel()
    
    var body: some View {
        TabView {
            LeaguesView(leaguesViewModel: leaguesViewModel)
                .tabItem {
                    Label("Leagues", systemImage: "trophy")
                }
            
            TeamImageView(teamId: 1)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
            MatchesByDateView(mathesByDateViewModel: mathesByDateViewModel)
                .tabItem {
                    Label("Matches", systemImage: "soccerball")
                }
        }
    }
}

#Preview {
    MainView()
}
