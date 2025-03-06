//
//  TextModifiers.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.03.2025.
//

import SwiftUI

enum TextModifiers {
    struct BodyTextModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(.rect(cornerRadius: 10))
        }
    }
}

extension View {
    func bodyTextStyle() -> some View {
        self.modifier(TextModifiers.BodyTextModifier())
    }

}
