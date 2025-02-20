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
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    selectedTab = "Results"
                }
            }) {
                Text("Results")
                    .font(.system(size: FontSizes.body, weight: .medium))
                    .foregroundColor(selectedTab == "Results" ? .white : Color(red: 0.44, green: 0.44, blue: 0.44))
            }
            
            Button(action: {
                withAnimation(.easeOut(duration: 0.3)) {
                    selectedTab = "Calendar"
                }
            }) {
                Text("Calendar")
                    .font(.system(size: FontSizes.body, weight: .medium))
                    .foregroundColor(selectedTab == "Calendar" ? .white : Color(red: 0.44, green: 0.44, blue: 0.44))
            }
        }
        .padding(5)
        .background(
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.red)
                        .frame(width: geometry.size.width / CGFloat(tabs.count), height: geometry.size.height)
                        .offset(x: selectedTab == "Calendar" ? geometry.size.width / 2 - 5 : -5)
                }
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    VStack {
        ToggleNavBar()
        Spacer()
    }
}
