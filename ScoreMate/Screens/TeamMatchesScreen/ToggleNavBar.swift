//
//  ToggleBar.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 19.02.2025.
//

import Foundation
import SwiftUI

struct ToggleNavBar: View {
    @State private var selectedTab: String = "Results"
    
    let tabs = ["Results", "Calendar"]

    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        selectedTab = tab
                    }
                }) {
                    Text(tab)
                        .font(.system(size: FontSizes.body, weight: .medium))
                        .foregroundColor(selectedTab == tab ? .white : Color(red: 0.44, green: 0.44, blue: 0.44))
                }
            }
        }
        .padding(5)
        .background(
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.red)
                        .frame(width: geometry.size.width / CGFloat(tabs.count), height: geometry.size.height)
                        .offset(x: selectedTab == "Calendar" ? geometry.size.width / 2 : 0)
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    ToggleNavBar()
}
