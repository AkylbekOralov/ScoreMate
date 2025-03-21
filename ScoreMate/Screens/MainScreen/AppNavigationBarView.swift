//
//  AppNavigationBarView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct AppNavigationBarView: View {
    @Binding var currentScreen: AppScreens
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.secondary)
            HStack(spacing: screenWidth * 0.1) {
                VStack(spacing: Paddings.x3) {
                    Image(systemName: currentScreen == .leagues ? "trophy.fill" : "trophy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 27, height: 30)
                    Text("Leagues")
                        .font(.system(size: FontSizes.body))
                        .bold(currentScreen == .leagues)
                }
                .onTapGesture {
                    currentScreen = .leagues
                }
                
                VStack(spacing: Paddings.x3) {
                    Image(systemName: currentScreen == .matchesByDate ? "soccerball.inverse" : "soccerball")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    Text("Matches")
                        .font(.system(size: FontSizes.body))
                        .bold(currentScreen == .matchesByDate)
                }
                .onTapGesture {
                    currentScreen = .matchesByDate
                }
            }
            .padding(.top, Paddings.x2)
            .padding(.bottom, Paddings.x8)
        }
    }
}


struct NavBarView_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            VStack {
                Spacer()
                AppNavigationBarView(currentScreen: .constant(AppScreens.leagues))
            }
        }
        .ignoresSafeArea(.all)
    }
}
