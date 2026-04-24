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
                SmImages.football23.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(mathesByDateViewModel.rotationAngle))
                    .animation(.easeInOut(duration: 0.5), value: mathesByDateViewModel.rotationAngle)
                Rectangle()
                    .fill(SmColors.matchesHeaderDivider.swiftUIColor)
                    .frame(height: 1)
                    .padding(.bottom, Paddings.x2)
                
                MatchDateSelectorView(matchesByDateViewModel: mathesByDateViewModel)
            }
            .padding(.top, Paddings.x4)
            .padding(.bottom, Paddings.x4)
            .background(SmColors.matchesHeaderBackground.swiftUIColor)
            
            ScrollView {
                VStack(spacing: Paddings.x4) {
                    if let errorMessage = mathesByDateViewModel.errorMessage {
                        Text(errorMessage)
                    } else if let matches = mathesByDateViewModel.selectedDateMatches {
                        ForEach(matches) { match in
                            if match.statusName == "Finished" {
                                HStack {
                                    FinishedMatchView(match: match, withDate: false)
                                    Spacer(minLength: 0)
                                }
                            } else if match.statusName == "Notstarted" {
                                HStack {
                                    UpcomingMatchView(match: match)
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    } else {
                        Text("No matches")
                    }
                }
                .padding(.horizontal, Paddings.x4)
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
