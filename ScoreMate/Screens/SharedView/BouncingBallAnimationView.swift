//
//  loadingBallView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 16.02.2025.
//

import Foundation
import SwiftUI

struct BouncingBallAnimationView: View {
    @State private var bounce = false
    
    var body: some View {
        VStack {
            Image("football23")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .offset(y: bounce ? -40 : 40)
                .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: bounce)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        bounce.toggle()
                    }
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(Paddings.x11)
    }
}

#Preview {
    ZStack {
        Color.green.opacity(0.2)
            .ignoresSafeArea(edges: .all)
        BouncingBallAnimationView()
    }
}
