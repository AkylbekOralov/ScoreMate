//
//  TeamMatchesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation
import Alamofire

class TeamMatchesViewModel: ObservableObject {
    enum TeamMatchesSelection {
        case results
        case calendar
    }
    
    let league: LeagueModel
    let team: TeamModel
    var finishedMatches: [MatchModel] = []
    var upcomingMatches: [MatchModel] = []
    @Published var displayedMatches: [MatchModel] = []
    @Published var selection: TeamMatchesSelection
    
    init(league: LeagueModel, team: TeamModel) {
        self.league = league
        self.team = team
        self.selection = .results
        fetchMatches()
    }
    
    func changeSelection(selected: TeamMatchesSelection) {
        self.selection = selected
        setDisplayedMatches()
    }
    
    private func setDisplayedMatches(){
        switch selection {
        case .results:
            displayedMatches = finishedMatches
        case .calendar:
            displayedMatches = upcomingMatches
        }
    }
    
    func fetchMatches() {
        let urlString = """
        https://api.soccersapi.com/v2.2/fixtures/?\
        user=\(ApiCall.username)&\
        token=\(ApiCall.token)&\
        t=season&\
        season_id=\(league.currentSeasonId)&\
        team_id=\(team.id)
        """
        
        AF.request(urlString, method: .get)
            .validate()
            .responseDecodable(of: TeamMatchesModel.self) { response in
                switch response.result {
                case .success(let soccerResponse):
                    var finished: [MatchModel] = []
                    var upcoming: [MatchModel] = []
                    
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
                            
                            if matchData.statusName == "Finished" {
                                finished.insert(match, at: 0)
                            } else if matchData.statusName == "Notstarted" {
                                upcoming.append(match)
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self.finishedMatches = finished
                        self.upcomingMatches = upcoming
                        self.setDisplayedMatches()
                    }
                    
                case .failure(let error):
                    print("Error fetching matches: \(error.localizedDescription)")
                }
            }
    }
}
