//
//  TodayMathesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct RecentMathesView: View {
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    VStack {
                        Text("Fri")
                        Text("07.02")
                    }
                    VStack {
                        Text("Sun")
                        Text("08.02")
                    }
                    VStack {
                        Text("Sat")
                        Text("09.02")
                    }
                    VStack {
                        Text("Mon")
                        Text("10.02")
                    }
                    VStack {
                        Text("Tue")
                        Text("11.02")
                    }
                    VStack {
                        Text("Today")
                        Text("12.02")
                    }
                    .foregroundColor(.red)
                    .overlay(
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: .infinity, height: 1),
                        alignment: .bottom
                    )
                    VStack {
                        Text("Wed")
                        Text("11.02")
                    }
                    VStack {
                        Text("Thu")
                        Text("11.02")
                    }
                }
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    RecentMathesView()
}
