//
//  TeamMatchesViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation
import Alamofire

class TeamMatchesViewModel: ObservableObject {
    let league: LeagueModel
    let team: TeamModel
    @Published var finishedMatches: [MatchModel] = []
    @Published var UpcomingMatches: [MatchModel] = []
    
    init(league: LeagueModel, team: TeamModel) {
        self.league = league
        self.team = team
        self.finishedMatches = getMockMatches()
//        fetchMatches()
    }
    
    func fetchMatches() {
        let urlString = "https://api.soccersapi.com/v2.2/fixtures/?user=akylbekoralov2003&token=5224b1c38beea1f12750501e5cc458c0&t=season&season_id=\(league.currentSeasonId)&team_id=\(team.id)"
        
        AF.request(urlString, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                
                guard
                    let json = value as? [String: Any],
                    let dataArray = json["data"] as? [[String: Any]]
                else {
                    print("Failed to parse top-level JSON or 'data' array.")
                    return
                }
                
                var fetchedMatches: [MatchModel] = []
                
                for matchDict in dataArray {
                    
                    // Check if this match is "Finished"
                    guard
                        let statusName = matchDict["status_name"] as? String,
                        statusName == "Finished"
                    else {
                        continue
                    }
                    
                    guard
                        let id = matchDict["id"] as? Int,
                        let timeDict = matchDict["time"] as? [String: Any],
                        let date = timeDict["date"] as? String,
                        let teamsDict = matchDict["teams"] as? [String: Any],
                        let homeDict = teamsDict["home"] as? [String: Any],
                        let awayDict = teamsDict["away"] as? [String: Any],
                        let homeTeamName = homeDict["name"] as? String,
                        let homeTeamImg = homeDict["img"] as? String,
                        let awayTeamName = awayDict["name"] as? String,
                        let awayTeamImg = awayDict["img"] as? String,
                        let scoresDict = matchDict["scores"] as? [String: Any]
                    else {
                        continue
                    }
                    
                    let homeScore = Int(scoresDict["home_score"] as? String ?? "0") ?? 0
                    let awayScore = Int(scoresDict["away_score"] as? String ?? "0") ?? 0
                    
                    let match = MatchModel(
                        id: id,
                        date: date,
                        homeTeam: homeTeamName,
                        homeTeamImage: homeTeamImg,
                        homeScore: homeScore,
                        awayTeam: awayTeamName,
                        awayTeamImage: awayTeamImg,
                        awayScore: awayScore
                    )
                    
                    fetchedMatches.append(match)
                }

                DispatchQueue.main.async {
                    self.finishedMatches = fetchedMatches
                }
                
            case .failure(let error):
                print("Error while fetching matches: \(error)")
            }
        }
    }
    
    func getMockMatches() -> [MatchModel] {
        
        return [
            MatchModel(
                id: 1891183,
                date: "2024-10-19",
                homeTeam: "Auckland FC",
                homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
                homeScore: 2,
                awayTeam: "Brisbane Roar",
                awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1105.png",
                awayScore: 0),
            MatchModel(
                id: 1891192,
                date: "2024-10-27",
                homeTeam: "Auckland FC",
                homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1102.png",
                homeScore: 1,
                awayTeam: "Sydney",
                awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1097.png",
                awayScore: 0),
            MatchModel(
                id: 1891195,
                date: "2024-11-02",
                homeTeam: "Wellington",
                homeTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
                homeScore: 0,
                awayTeam: "Auckland FC",
                awayTeamImage: "https://cdn.soccersapi.com/images/soccer/teams/80/1931466026.png",
                awayScore: 2)
        ]
    }
}


