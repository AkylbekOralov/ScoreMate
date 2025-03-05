//
//  RecentMathesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 12.02.2025.
//

import Foundation
import Alamofire

class MatchesByDateViewModel: ObservableObject {
    @Published var dates: [DateModel] = []
    @Published var selectedDate: String = ""
    @Published var selectedDateMatches: [MatchModel]?
    @Published var errorMessage: String? = nil
    
    @Published var rotationAngle: Double = 0
    private var rotationDirection: Double = 1
    
    private var matchesByDateService: MatchesByDateService = MatchesByDateService()

    init() {
        generateRecentDates()
        self.matchesByDateService = MatchesByDateService()
        fetchSelectedDateMatches()
    }
    
    private func generateRecentDates() {
        let calendar = Calendar.current
        let dayOfTheWeekFormatter = DateFormatter()
        
        dayOfTheWeekFormatter.dateFormat = "E"
        
        let dayMonthFormatter = DateFormatter()
        dayMonthFormatter.dateFormat = "dd.MM"
        
        let fullDateFormatter = DateFormatter()
        fullDateFormatter.dateFormat = "yyyy-MM-dd"
        
        let today = Date()
        self.selectedDate = fullDateFormatter.string(from: today)
        
        if let oneWeekAgo = calendar.date(byAdding: .day, value: -7, to: today) {
            for i in 0...14 {
                if let date = calendar.date(byAdding: .day, value: i, to: oneWeekAgo) {
                    let dayOfWeek = calendar.isDate(date, equalTo: today, toGranularity: .day) ? "Today" : dayOfTheWeekFormatter.string(from: date)
                    let dateString = dayMonthFormatter.string(from: date)
                    let fullDateString = fullDateFormatter.string(from: date)
                    dates.append(DateModel(dayOfWeek: dayOfWeek, dateString: dateString, fullDateString: fullDateString))
                }
            }
        }
    }
    
    func changeSelectedDate(dateString: String) {
        self.selectedDateMatches = []
        self.rotationDirection = isEarlier(self.selectedDate, dateString) ? 1 : -1
        self.rotationAngle += 360*1.3*self.rotationDirection
        self.selectedDate = dateString
        fetchSelectedDateMatches()
    }
    
    private func isEarlier(_ dateString1: String, _ dateString2: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date1 = dateFormatter.date(from: dateString1),
           let date2 = dateFormatter.date(from: dateString2) {
            return date1 < date2
        }
        
        return false
    }
    
    private func fetchSelectedDateMatches() {
        self.errorMessage = nil
        
        matchesByDateService.fetchMatchesByDate(date: self.selectedDate) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let matchesByDate):
                    self.selectedDateMatches = matchesByDate
                case .failure(let error):
                    print("MatchesByDateViewModel fetchSelectedDateMatches error: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
