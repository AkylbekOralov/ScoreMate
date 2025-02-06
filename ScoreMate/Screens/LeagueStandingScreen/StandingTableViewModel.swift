//
//  StandingTableViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import Foundation
import Alamofire

class StandingTableViewModel: ObservableObject {
    
    let leagueModel: LeagueModel
    @Published var standings: [TeamModel] = []
    
    init(leagueModel: LeagueModel) {
        self.leagueModel = leagueModel
        //        self.standings = getMockData()
        fetchStandings()
    }
    
    func fetchStandings() {
        let url = "https://api.soccersapi.com/v2.2/leagues/?user=akylbekoralov2003&token=5224b1c38beea1f12750501e5cc458c0&t=standings&season_id=\(leagueModel.currentSeasonId)"
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: StandingAPIResponse.self) { response in
                
                switch response.result {
                    
                case .success(let data):
                    DispatchQueue.main.async {
                        
                        self.standings = data.data?.standings?.map { team in
                            TeamModel(
                                id: team.team_id,
                                name: team.team_name,
                                gamesPlayed: team.overall.games_played,
                                goalsScored: team.overall.goals_scored,
                                goalsAgainst: team.overall.goals_against,
                                points: team.overall.points
                            )
                        } ?? []
                        
                    }
                    
                case .failure(let error):
                    print("Error fetching leagues: \(error.localizedDescription)")
                    
                }
                
            }
    }
    
    func getMockData() -> [TeamModel] {
        return [
            TeamModel(id: 1931466026, name: "Auckland FC", gamesPlayed: 15, goalsScored: 24, goalsAgainst: 12, points: 33),
            TeamModel(id: 1096, name: "Adelaide United FC", gamesPlayed: 14, goalsScored: 32, goalsAgainst: 25, points: 28),
            TeamModel(id: 1103, name: "Western United FC", gamesPlayed: 15, goalsScored: 28, goalsAgainst: 22, points: 25),
            TeamModel(id: 1097, name: "Sydney FC", gamesPlayed: 16, goalsScored: 36, goalsAgainst: 27, points: 24),
            TeamModel(id: 122648729, name: "Macarthur FC", gamesPlayed: 16, goalsScored: 30, goalsAgainst: 22, points: 24),
            TeamModel(id: 1101, name: "Melbourne City FC", gamesPlayed: 14, goalsScored: 21, goalsAgainst: 14, points: 24),
            TeamModel(id: 1100, name: "Melbourne Victory", gamesPlayed: 14, goalsScored: 22, goalsAgainst: 17, points: 22),
            TeamModel(id: 1098, name: "Western Sydney Wanderers FC", gamesPlayed: 15, goalsScored: 30, goalsAgainst: 27, points: 21),
            TeamModel(id: 1099, name: "Central Coast Mariners FC", gamesPlayed: 15, goalsScored: 17, goalsAgainst: 24, points: 19),
            TeamModel(id: 1102, name: "Wellington Phoenix FC", gamesPlayed: 14, goalsScored: 15, goalsAgainst: 17, points: 18),
            TeamModel(id: 1106, name: "Newcastle United Jets FC", gamesPlayed: 13, goalsScored: 16, goalsAgainst: 23, points: 11),
            TeamModel(id: 1104, name: "Perth Glory FC", gamesPlayed: 15, goalsScored: 11, goalsAgainst: 37, points: 9),
            TeamModel(id: 1105, name: "Brisbane Roar FC", gamesPlayed: 14, goalsScored: 16, goalsAgainst: 31, points: 5)
        ]
    }
    
}

struct StandingAPIResponse: Decodable {
    let data: LeagueStandingsData?
}

struct LeagueStandingsData: Decodable {
    let standings: [TeamModelData]?
}

struct TeamModelData: Decodable {
    let team_id: Int
    let team_name: String
    let overall: OverallStats
}

struct OverallStats: Decodable {
    let games_played: Int
    let goals_scored: Int
    let goals_against: Int
    let points: Int
}
