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
            VStack(spacing: 0) {
                Image("football23")
                Rectangle()
                    .fill(.white.opacity(0.7))
                    .frame(height: 1)
                    .padding(.bottom, Paddings.x2)
                RecentDatesView(recentMathesViewModel: recentMathesViewModel)
            }
            .padding(.top, 70)
            .padding(.bottom, Paddings.x4)
            .background(Color(red: 0.75, green: 0.26, blue: 0.26))
            
            VStack {
                if let matches = recentMathesViewModel.selectedDateMatches {
                    ForEach(matches) { match in
                        RecentMatchView(match: match)
                    }
                } else {
                    Text("No matches")
                }
            }
            .padding(.top, 70)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .top
        )
        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
    }
}

#Preview {
    ZStack {
        RecentMathesView(recentMathesViewModel: RecentMathesViewModel())
    }
    .ignoresSafeArea(.all)
}

struct RecentDatesView: View {
    @StateObject var recentMathesViewModel: RecentMathesViewModel
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Paddings.x4) {
                    ForEach(recentMathesViewModel.recentDates) { date in
                        VStack(spacing: Paddings.x1) {
                            Text(date.dayOfWeek)
                                .font(.system(size: FontSizes.body, weight: .medium))
                            Text(date.dateString)
                                .font(.system(size: FontSizes.body, weight: .semibold))
                        }
                        .foregroundColor(date.fullDateString == recentMathesViewModel.selectedDate ? .white : .white.opacity(0.7))
                        .onTapGesture {
                            recentMathesViewModel.changeSelectedDate(dateString: date.fullDateString)
                        }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    proxy.scrollTo(recentMathesViewModel.selectedDate, anchor: .center)
                }
            }
        }
    }
}
