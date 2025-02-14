//
//  TodayMathesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct RecentMathesView: View {
    
    @StateObject var recentMathesViewModel: RecentMathesViewModel
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(recentMathesViewModel.recentDates, id: \.dateString ) { date in
                            VStack {
                                Text(date.dayOfWeek)
                                Text(date.dateString)
                            }
                            .foregroundColor(date.dateString == recentMathesViewModel.selectedDate ? .red : .primary)
                            .onTapGesture {
                                recentMathesViewModel.changeSelectedDate(dateString: date.dateString)
                            }
                        }
                    }
                }
                .onAppear {
                    // Scroll to the selected date when the view appears
                    DispatchQueue.main.async {
                        proxy.scrollTo(recentMathesViewModel.selectedDate, anchor: .center)
                    }
                }
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    RecentMathesView(recentMathesViewModel: RecentMathesViewModel())
}
