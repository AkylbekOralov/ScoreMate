//
//  TeamMatchesService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.03.2025.
//

import Foundation

class TeamMatchesService {
    func fetchTeamMatches(seasonId: Int, teamId: Int, completion: @escaping (Result<TeamMatchesModel, APIError>) -> Void) {
        let url = APIEndpoints.teamMatches(seasonId: String(seasonId), teamId: String(teamId))
        
        NetworkService.getData(url: url, dataType: TeamMatchesAPIResponse.self) { result in
            switch result {
            case .success(let data):
                var finishedMatches: [MatchModel] = []
                var upcomingMatches: [MatchModel] = []
                
                if let matchesData = data.data {
                    for matchData in matchesData {
                        let homeScore = Int(matchData.scores.homeScore ?? "0") ?? 0
                        let awayScore = Int(matchData.scores.awayScore ?? "0") ?? 0
                        
                        var formattedMatchTime: String?
                        if let matchTime = matchData.time.timeOclock {
                            formattedMatchTime = String(matchTime.prefix(5))
                        }
                        
                        let match = MatchModel(
                            id: matchData.id ?? 0,
                            statusName: matchData.statusName ?? "Unknown",
                            date: matchData.time.date ?? "Unknown",
                            time: formattedMatchTime ?? "Unknown",
                            homeTeam: matchData.teams.home.name ?? "Unknown",
                            homeTeamCode: matchData.teams.home.nameCode ?? "UNK",
                            homeTeamId: matchData.teams.home.id ?? 0,
                            homeScore: homeScore,
                            awayTeam: matchData.teams.away.name ?? "Unknown",
                            awayTeamCode: matchData.teams.away.nameCode ?? "UNK",
                            awayTeamId: matchData.teams.away.id ?? 0,
                            awayScore: awayScore
                        )
                        
                        if matchData.statusName == "Finished" {
                            finishedMatches.insert(match, at: 0)
                        } else if matchData.statusName == "Notstarted" {
                            upcomingMatches.append(match)
                        }
                    }
                }
                
                let teamMatchesModel = TeamMatchesModel(finishedMatches: finishedMatches, upcomingMatches: upcomingMatches)
                
                completion(.success(teamMatchesModel))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
