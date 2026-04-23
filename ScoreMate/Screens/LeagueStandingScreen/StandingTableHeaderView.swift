//
//  StandingTableHeaderView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI
import FactoryKit

struct StandingTableHeaderView: View {
    @Injected(\.colors) private var colors: Colors
    
    var line: some View {
        Rectangle()
            .fill(colors.tableDivider)
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
            .foregroundColor(colors.secondaryText)
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
