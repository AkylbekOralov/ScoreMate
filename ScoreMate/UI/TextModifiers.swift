//
//  TextModifiers.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.03.2025.
//

import SwiftUI

enum TextModifiers {
    struct Title: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
        }
    }

    struct Subtitle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.title2)
                .foregroundStyle(.gray)
                .padding()
        }
    }

    struct Highlighted: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.headline)
                .foregroundStyle(.yellow)
                .background(.black)
                .padding()
                .clipShape(.capsule)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(TextModifiers.Title())
    }

    func subtitleStyle() -> some View {
        self.modifier(TextModifiers.Subtitle())
    }

    func highlightedStyle() -> some View {
        self.modifier(TextModifiers.Highlighted())
    }
}
