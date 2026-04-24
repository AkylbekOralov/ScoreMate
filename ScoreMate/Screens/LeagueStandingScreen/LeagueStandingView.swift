//
//  LeagueStandingView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import SwiftUI

struct LeagueStandingView: View {
    @StateObject var leagueStandingViewModel: LeagueStandingViewModel
    @Environment(\.dismiss) private var dismiss

    init(leagueStandingViewModel: LeagueStandingViewModel) {
        self._leagueStandingViewModel = StateObject(wrappedValue: leagueStandingViewModel)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: SmColors.appBackground.swiftUIColor, location: 0.00),
                    Gradient.Stop(color: SmColors.leagueAccentColor(name: leagueStandingViewModel.leagueModel.name), location: 0.25),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .edgesIgnoringSafeArea(.all)
            
            
            Button(action: {
                dismiss()
            }) {
                SmImages.backButton.swiftUIImage
                    .padding(.leading, Paddings.x4)
                    .padding(.top, Paddings.x1)
            }
            .zIndex(1)
            
            VStack(spacing: 0) {
                LeagueHeaderView(leagueModel: leagueStandingViewModel.leagueModel)
                VStack {
                    LeagueTableView(leagueStandingViewModel: leagueStandingViewModel)
                }
                .padding(.top, Paddings.x6)
                .frame(maxHeight: .infinity)
                .background(SmColors.appBackground.swiftUIColor)
                .cornerRadius(35, corners: [.topLeft, .topRight])
                .shadow(color: SmColors.cardShadow.swiftUIColor, radius: 15, x: 0, y: 4)
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .navigationBarBackButtonHidden(true)
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 100 {
                        dismiss()
                    }
                }
        )
    }
}
