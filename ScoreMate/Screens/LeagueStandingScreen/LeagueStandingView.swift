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
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(UIColor.systemBackground), location: 0.00),
                    Gradient.Stop(color: Colors.shared.leagueAccentColor(name: leagueStandingViewModel.leagueModel.name), location: 0.25),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .edgesIgnoringSafeArea(.all)
            
            
            Button(action: {
                dismiss()
            }) {
                Image("backButton")
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
                .background(.background)
                .cornerRadius(35, corners: [.topLeft, .topRight])
                .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 4)
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
