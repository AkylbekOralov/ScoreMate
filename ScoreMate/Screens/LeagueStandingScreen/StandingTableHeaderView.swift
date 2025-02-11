//
//  StandingTableHeaderView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct StandingTableHeaderView: View {
    var body: some View {
        HStack {
            Text("#")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.08, alignment: .leading)
            Text("Team")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("M")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
            Text("GS/GA")
                .font(.system(size: 18, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.14, alignment: .center)
            Text("P")
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: UIScreen.main.bounds.width * 0.06, alignment: .center)
            
        }
        .padding()
    }
}

#Preview {
    StandingTableHeaderView()
}
