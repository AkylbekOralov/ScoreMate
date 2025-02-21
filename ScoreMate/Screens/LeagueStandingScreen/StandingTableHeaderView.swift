//
//  StandingTableHeaderView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct StandingTableHeaderView: View {
    let screenWidth = UIScreen.main.bounds.width
    
    var line: some View {
        Rectangle()
            .fill(Color(red: 0.85, green: 0.85, blue: 0.85))
            .frame(height: 1)
    }
    
    var body: some View {
        VStack(spacing: Paddings.x2) {
            line
            
            HStack(spacing: 0) {
                Text("#")
                    .frame(width: screenWidth * 0.08, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
                Text("Team")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
                Text("M")
                    .frame(width: screenWidth * 0.06, alignment: .center)
                    .padding(.trailing, Paddings.x2)
                Text("GS/GA")
                    .frame(width: screenWidth * 0.14, alignment: .center)
                    .padding(.trailing, Paddings.x2)
                Text("P")
                    .frame(width: screenWidth * 0.07, alignment: .center)
            }
            .font(.system(size: FontSizes.body, weight: .medium))
            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
            .padding(.horizontal, Paddings.x4)
            
            line
        }
    }
    
}

#Preview {
    VStack {
        StandingTableHeaderView()
        Spacer()
    }
    
}
