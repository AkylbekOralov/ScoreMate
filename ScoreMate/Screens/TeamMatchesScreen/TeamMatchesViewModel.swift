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
          .responseDecodable(of: SoccerResponse.self) { response in
              switch response.result {
              case .success(let soccerResponse):
                  var finished: [MatchModel] = []
                  var upcoming: [MatchModel] = []
                  
                  for matchData in soccerResponse.data {
                      let homeScore = Int(matchData.scores.homeScore ?? "0")
                      let awayScore = Int(matchData.scores.awayScore ?? "0")
                      
                      let match = MatchModel(
                          id: matchData.id ?? 0,
                          date: matchData.time.date ?? "?",
                          homeTeam: matchData.teams.home.name ?? "Unkonwn",
                          homeTeamId: matchData.teams.home.id ?? 0,
                          homeScore: homeScore ?? 0,
                          awayTeam: matchData.teams.away.name ?? "Unknown",
                          awayTeamId: matchData.teams.away.id ?? 0,
                          awayScore: awayScore ?? 0
                      )
                      
                      if matchData.statusName == "Finished" {
                          finished.insert(match, at: 0)
                      } else if matchData.statusName == "Notstarted" {
                          upcoming.append(match)
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
    
    // перетащить в NetworkService и сложить туда url
    func getData<T: Decodable>(url: String, dataType: T.Type, completion: @escaping (T?, Error?) -> Void) {
        AF.request(url, method: .get)
          .validate()
          .responseDecodable(of: dataType.self) { response in
              switch response.result {
              case .success(let succesfulResponse):
                  completion(succesfulResponse, nil)
              case .failure(let error):
                  completion(nil, error)
              }
          }
    }
    
    func getMockFinishedMatches() -> [MatchModel] {
        
        return [
            MatchModel(
                id: 1891183,
                date: "2024-10-19",
                homeTeam: "Auckland FC",
                homeTeamId: 1931466026,
                homeScore: 2,
                awayTeam: "Brisbane Roar",
                awayTeamId: 1105,
                awayScore: 0),
            MatchModel(
                id: 1891192,
                date: "2024-10-27",
                homeTeam: "Auckland FC",
                homeTeamId: 1102,
                homeScore: 1,
                awayTeam: "Sydney",
                awayTeamId: 1097,
                awayScore: 0),
            MatchModel(
                id: 1891195,
                date: "2024-11-02",
                homeTeam: "Wellington",
                homeTeamId: 1931466026,
                homeScore: 0,
                awayTeam: "Auckland FC",
                awayTeamId: 1931466026,
                awayScore: 2)
        ]
    }
    
    func getMockUpcomingMatches() -> [MatchModel] {
        return [
            MatchModel(
                id: 1891183,
                date: "2023-10-19",
                homeTeam: "Real Madrid",
                homeTeamId: 11,
                homeScore: 3,
                awayTeam: "Brisbane Roar",
                awayTeamId: 1105,
                awayScore: 0),
            MatchModel(
                id: 1891192,
                date: "2024-10-27",
                homeTeam: "Bayern",
                homeTeamId: 11,
                homeScore: 1,
                awayTeam: "Sydney",
                awayTeamId: 11,
                awayScore: 0),
            MatchModel(
                id: 1891195,
                date: "2024-11-02",
                homeTeam: "Barcelona",
                homeTeamId: 15,
                homeScore: 0,
                awayTeam: "Auckland FC",
                awayTeamId: 16,
                awayScore: 2)
        ]
    }
}
