//
//  loadingBallView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 16.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct JumpingBallView: View {
    var body: some View {
        VStack {
            AnimatedImage(name: "BouncingFootball.gif", isAnimating: .constant(true))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    JumpingBallView()
}
