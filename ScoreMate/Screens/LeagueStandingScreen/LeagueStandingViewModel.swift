//
//  StandingTableViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import Foundation
import Alamofire
import SwiftUI

class LeagueStandingViewModel: ObservableObject {
    let leagueModel: LeagueModel
    let accentColor: Color
    @Published var standings: [TeamModel] = []
    @Published var errorMessage: String? = nil
    
    init(leagueModel: LeagueModel) {
        self.leagueModel = leagueModel
        switch leagueModel.name {
        case "A-League":
            self.accentColor = Backgrounds.aLeague
        case "Tipico Bundesliga":
            self.accentColor = Backgrounds.tipicoBundusligo
        case "Superliga":
            self.accentColor = Backgrounds.superLiga
        default:
            self.accentColor = Backgrounds.aLeague
        }
        fetchStandings()
    }
    
    func fetchStandings() {
        self.errorMessage = nil
        let url = "https://api.soccersapi.com/v2.2/leagues/?user=\(ApiCall.username)&token=\(ApiCall.token)&t=standings&season_id=\(leagueModel.currentSeasonId)"
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: StandingAPIResponse.self) { response in
                
                switch response.result {
                    
                case .success(let data):
                    DispatchQueue.main.async {
                        
                        self.standings = data.data?.standings?.map { team in
                            TeamModel(
                                id: team.teamId,
                                name: team.teamName,
                                gamesPlayed: team.overall.gamesPlayed,
                                goalsScored: team.overall.goalsScored,
                                goalsAgainst: team.overall.goalsAgainst,
                                points: team.overall.points
                            )
                        } ?? []
                        
                    }
                case .failure(let error):
                    print("LeagueStandingViewModel error fetching league standings: \(error.localizedDescription)")
                    self.errorMessage = "Failed to load leagues. Please try again."
                }
                
            }
    }
}

struct StandingAPIResponse: Decodable {
    let data: LeagueStandingsData?
}

struct LeagueStandingsData: Decodable {
    let standings: [TeamModelData]?
}

struct TeamModelData: Decodable {
    let teamId: Int
    let teamName: String
    let overall: OverallStats
    
    enum CodingKeys: String, CodingKey {
        case teamId = "team_id"
        case teamName = "team_name"
        case overall
    }
}

struct OverallStats: Decodable {
    let gamesPlayed: Int
    let goalsScored: Int
    let goalsAgainst: Int
    let points: Int
    
    enum CodingKeys: String, CodingKey {
        case gamesPlayed = "games_played"
        case goalsScored = "goals_scored"
        case goalsAgainst = "goals_against"
        case points
    }
}
