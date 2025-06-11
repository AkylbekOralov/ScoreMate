//
//  MatchesByDateView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct MatchesByDateView: View {
    @ObservedObject var mathesByDateViewModel: MatchesByDateViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Image("football23")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(mathesByDateViewModel.rotationAngle))
                    .animation(.easeInOut(duration: 0.5), value: mathesByDateViewModel.rotationAngle)
                Rectangle()
                    .fill(.white.opacity(0.7))
                    .frame(height: 1)
                    .padding(.bottom, Paddings.x2)
                
                MatchDateSelectorView(matchesByDateViewModel: mathesByDateViewModel)
            }
            .padding(.top, Paddings.x4)
            .padding(.bottom, Paddings.x4)
            .background(Color(red: 0.75, green: 0.26, blue: 0.26))
            
            ScrollView {
                VStack(spacing: Paddings.x4) {
                    if let errorMessage = mathesByDateViewModel.errorMessage {
                        Text(errorMessage)
                    } else if let matches = mathesByDateViewModel.selectedDateMatches {
                        ForEach(matches) { match in
                            if match.statusName == "Finished" {
                                FinishedMatchView(match: match, withDate: false)
                            } else if match.statusName == "Notstarted" {
                                UpcomingMatchView(match: match)
                            }
                        }
                    } else {
                        Text("No matches")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, Paddings.x8)
            }
        }
    }
}

#Preview {
    
    TabView {
        MatchesByDateView(mathesByDateViewModel: MatchesByDateViewModel())
            .tabItem {
                Label("Matches", systemImage: "soccerball")
            }
        
        Rectangle()
            .tabItem {
                Label("Leagues", systemImage: "trophy")
            }
    }
}
