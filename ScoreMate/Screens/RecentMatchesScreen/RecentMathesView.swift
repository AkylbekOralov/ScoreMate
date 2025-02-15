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
            RecentDatesView(recentMathesViewModel: recentMathesViewModel)
                .padding(.bottom, Paddings.large)
            
            VStack {
                if let matches = recentMathesViewModel.selectedDateMatches {
                    ForEach(matches) { match in
                        RecentMatchView(match: match)
                    }
                } else {
                    Text("No matches")
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

struct RecentDatesView: View {
    @StateObject var recentMathesViewModel: RecentMathesViewModel
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(recentMathesViewModel.recentDates) { date in
                        VStack {
                            Text(date.dayOfWeek)
                            Text(date.dateString)
                        }
                        .foregroundColor(date.fullDateString == recentMathesViewModel.selectedDate ? .red : .primary)
                        .onTapGesture {
                            recentMathesViewModel.changeSelectedDate(dateString: date.fullDateString)
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
}
