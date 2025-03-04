//
//  RecentMathesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 12.02.2025.
//

import Foundation
import Alamofire

class RecentMathesViewModel: ObservableObject {
    @Published var recentDates: [DateModel] = []
    @Published var selectedDate: String = ""
    @Published var selectedDateMatches: [MatchModel]?
    @Published var errorMessage: String? = nil
    
    init() {
        generateRecentDates()
        updateDisplayedMatches()
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
                    recentDates.append(DateModel(dayOfWeek: dayOfWeek, dateString: dateString, fullDateString: fullDateString))
                }
            }
        }
    }
    
    func changeSelectedDate(dateString: String) -> Double {
        self.selectedDateMatches = nil
        var result: Double = isEarlier(self.selectedDate, dateString) ? 1 : -1
        self.selectedDate = dateString
        updateDisplayedMatches()
        return result
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
    
    private func updateDisplayedMatches() {
        let urlString = """
            https://api.soccersapi.com/v2.2/fixtures/?\
            user=\(ApiCall.username)&\
            token=\(ApiCall.token)&\
            t=schedule&\
            d=\(self.selectedDate)
            """
        self.errorMessage = nil
        
        AF.request(urlString, method: .get)
            .validate()
            .responseDecodable(of: SoccerResponse.self) { response in
                switch response.result {
                case .success(let soccerResponse):
                    var matches: [MatchModel] = []
                    
                    if let matchesData = soccerResponse.data {
                        for matchData in matchesData {
                            let homeScore = Int(matchData.scores.homeScore ?? "0")
                            let awayScore = Int(matchData.scores.awayScore ?? "0")
                            
                            var formattedMatchTime: String?
                            if let matchTime = matchData.time.timeOclock {
                                formattedMatchTime = String(matchTime.prefix(5))
                            }
                            
                            let match = MatchModel(
                                id: matchData.id ?? 0,
                                statusName: matchData.statusName ?? "Unknown",
                                date: matchData.time.date ?? "Unknown",
                                time: formattedMatchTime ?? "Unknown",
                                homeTeam: matchData.teams.home.name ?? "Unkonwn",
                                homeTeamCode: matchData.teams.home.nameCode ?? "UNK",
                                homeTeamId: matchData.teams.home.id ?? 0,
                                homeScore: homeScore ?? 0,
                                awayTeam: matchData.teams.away.name ?? "Unknown",
                                awayTeamCode: matchData.teams.away.nameCode ?? "UNK",
                                awayTeamId: matchData.teams.away.id ?? 0,
                                awayScore: awayScore ?? 0
                            )
                            matches.insert(match, at: 0)
                        }
                    }
                    
                    if !matches.isEmpty {
                        self.selectedDateMatches = matches
                    } else {
                        self.selectedDateMatches = nil
                    }
                    
                case .failure(let error):
                    print("RecentMatchesViewModel error fetching matches: \(error.localizedDescription)")
                    self.errorMessage = "Failed to load mathces"
                }
            }
    }
}
