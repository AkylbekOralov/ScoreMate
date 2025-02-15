//
//  NavBarView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct NavBarView: View {
    @Binding var currentScreen: Screens
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.secondary)
            HStack(spacing: 40) {
                Button {
                    currentScreen = .leagues
                } label: {
                    VStack {
                        Image(systemName: currentScreen == .leagues ? "trophy.fill" : "trophy")
                            .foregroundColor(.primary)
                            .font(.system(size: 20))
                        Text("Leagues")
                            .padding(Paddings.medium)
                            .bold(currentScreen == .leagues)
                            .foregroundColor(.primary)
                    }
                }
                
                Button {
                    currentScreen = .matches
                } label: {
                    VStack {
                        Image(systemName: currentScreen == .matches ? "soccerball.inverse" : "soccerball")
                            .foregroundColor(.primary)
                            .font(.system(size: 20))
                        Text("Matches")
                            .padding(Paddings.medium)
                            .bold(currentScreen == .matches)
                            .foregroundColor(.primary)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, Paddings.medium)
            .background(.white)
            
        }
    }
}


struct NavBarView_Preview: PreviewProvider {
    
    static var previews: some View {
        NavBarView(currentScreen: .constant(Screens.leagues))
    }
}
