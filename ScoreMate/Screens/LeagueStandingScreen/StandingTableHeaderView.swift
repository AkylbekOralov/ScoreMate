//
//  StandingTableHeaderView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct StandingTableHeaderView: View {
    
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
                    .frame(width: 25, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
                Text("Team")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, Paddings.x1)
                Text("M")
                    .frame(width: 25, alignment: .center)
                    .padding(.trailing, Paddings.x2)
                Text("GS/GA")
                    .frame(width: 54, alignment: .center)
                    .padding(.trailing, Paddings.x2)
                Text("P")
                    .frame(width: 25, alignment: .center)
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
