//
//  MatchDateSelectorView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 20.02.2025.
//

import SwiftUI

struct MatchDateSelectorView: View {
    @StateObject var matchesByDateViewModel: MatchesByDateViewModel
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Paddings.x4) {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width / 2 - 40)
                    ForEach(matchesByDateViewModel.dates) { date in
                        VStack(spacing: Paddings.x1) {
                            Text(date.dayOfWeek)
                                .font(.system(size: FontSizes.body, weight: .medium))
                            Text(date.dateString)
                                .font(.system(size: FontSizes.body, weight: .semibold))
                        }
                        .foregroundColor(date.fullDateString == matchesByDateViewModel.selectedDate ? SmColors.inverseText.swiftUIColor : SmColors.matchesHeaderDivider.swiftUIColor)
                        .onTapGesture {
                                matchesByDateViewModel.changeSelectedDate(dateString: date.fullDateString)
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
                    proxy.scrollTo(matchesByDateViewModel.selectedDate, anchor: .center)
                }
            }
            .onChange(of: matchesByDateViewModel.selectedDate) { _, newValue in
                withAnimation(.easeInOut(duration: 0.5)) {
                    proxy.scrollTo(newValue, anchor: .center)
                }
            }
        }
    }
}
