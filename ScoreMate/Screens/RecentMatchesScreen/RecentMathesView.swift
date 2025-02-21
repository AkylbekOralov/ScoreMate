//
//  TodayMathesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct RecentMathesView: View {
    @StateObject var recentMathesViewModel: RecentMathesViewModel
    @State private var rotationAngle: Double = 0
    @State private var rotationDirection: Double = 0
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Image("football23")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.easeInOut(duration: 0.5), value: rotationAngle)
                Rectangle()
                    .fill(.white.opacity(0.7))
                    .frame(height: 1)
                    .padding(.bottom, Paddings.x2)
                RecentDatesView(recentMathesViewModel: recentMathesViewModel, rotationAngle: $rotationAngle, rotationDirection: $rotationDirection)
            }
            .padding(.top, 70)
            .padding(.bottom, Paddings.x4)
            .background(Color(red: 0.75, green: 0.26, blue: 0.26))
            
            ScrollView {
                VStack(spacing: Paddings.x4) {
                    if let errorMessage = recentMathesViewModel.errorMessage {
                        Text(errorMessage)
                    } else if let matches = recentMathesViewModel.selectedDateMatches {
                        ForEach(matches) { match in
                            if match.statusName == "Finihed" {
                                RecentFinishedMatchView(match: match)
                            } else if match.statusName == "Notstarted" {
                                RecentUpcomingMatchView(match: match)
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
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top
        )
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
    }
}

#Preview {
    ZStack {
        RecentMathesView(recentMathesViewModel: RecentMathesViewModel())
    }
    .ignoresSafeArea(.all)
}
