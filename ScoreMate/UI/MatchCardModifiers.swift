//
//  MatchCardModifiers.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.03.2025.
//

import SwiftUI

enum MatchCardModifiers {
    struct MatchCardStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.horizontal, Paddings.x11)
                .padding(.vertical, Paddings.x3)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .white, location: 0.00),
                            Gradient.Stop(color: Color(red: 0.98, green: 0.98, blue: 0.98), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.22, y: 0),
                        endPoint: UnitPoint(x: 0.82, y: 1)
                    )
                )
                .cornerRadius(Radii.medium)
                .shadow(color: .black.opacity(0.1), radius: 15, x: 0, y: 4)
        }
    }
}

extension View {
    func matchCardStyle() -> some View {
        self.modifier(MatchCardModifiers.MatchCardStyle())
    }
}
