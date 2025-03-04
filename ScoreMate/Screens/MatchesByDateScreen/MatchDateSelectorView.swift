//
//  RecentDatesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 20.02.2025.
//

import SwiftUI

struct MatchDateSelectorView: View {
    @StateObject var recentMathesViewModel: MathesByDateViewModel
    @Binding var rotationAngle: Double
    @Binding var rotationDirection: Double
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Paddings.x4) {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40)
                    ForEach(recentMathesViewModel.dates) { date in
                        VStack(spacing: Paddings.x1) {
                            Text(date.dayOfWeek)
                                .font(.system(size: FontSizes.body, weight: .medium))
                            Text(date.dateString)
                                .font(.system(size: FontSizes.body, weight: .semibold))
                        }
                        .foregroundColor(date.fullDateString == recentMathesViewModel.selectedDate ? .white : .white.opacity(0.7))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                rotationDirection = recentMathesViewModel.changeSelectedDate(dateString: date.fullDateString)
                            }
                        }
                        .gesture(
                            DragGesture()
                                .onChanged { _ in
                                }
                        )
                    }
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40)
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    proxy.scrollTo(recentMathesViewModel.selectedDate, anchor: .center)
                }
            }
            .onChange(of: recentMathesViewModel.selectedDate) { newValue in
                withAnimation(.easeInOut(duration: 0.5)) {
                    proxy.scrollTo(newValue, anchor: .center)
                    rotationAngle += 360*1.3*rotationDirection
                }
            }
        }
    }
}
