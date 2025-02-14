//
//  RecentMathesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 12.02.2025.
//

import Foundation

class RecentMathesViewModel: ObservableObject {
    @Published var recentDates: [(dayOfWeek: String, dateString: String)] = []
    @Published var selectedDate: String = ""
    
    init() {
        generateRecentDates()
    }
    
    private func generateRecentDates() {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E"
        
        let dateFormatterDate = DateFormatter()
        dateFormatterDate.dateFormat = "dd.MM"
        
        let today = Date()
        self.selectedDate = dateFormatterDate.string(from: today)
        
        if let oneWeekAgo = calendar.date(byAdding: .day, value: -8, to: today) {
            for i in 0...14 {
                if let date = calendar.date(byAdding: .day, value: i, to: oneWeekAgo) {
                    let dayOfWeek = calendar.isDate(date, equalTo: today, toGranularity: .day) ? "Today" : dateFormatter.string(from: date)
                    let dateString = dateFormatterDate.string(from: date)
                    recentDates.append((dayOfWeek, dateString))
                }
            }
        }
    }
    
    func changeSelectedDate(dateString: String) {
        self.selectedDate = dateString
    }
}
