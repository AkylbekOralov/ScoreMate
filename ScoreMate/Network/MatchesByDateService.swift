//
//  MatchesByDateService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 05.03.2025.
//

class MatchesByDateService {
    func fetchMatchesByDate(date: String, completion: @escaping (Result<[MatchModel], APIError>) -> Void)  {
        let url = APIEndpoints.matchesByDate(date: date)
        
        NetworkService.getData(url: url, dataType: TeamMatchesAPIResponse.self) { result in
            switch result {
            case .success(let data):
                let matchesByDate: [MatchModel] = data.data?.compactMap { match in
                    
                    guard
                        let homeScore = Int(match.scores.homeScore ?? "0"),
                        let awayScore = Int(match.scores.awayScore ?? "0")
                    else { return nil }
                    
                    var formattedMatchTime: String?
                    if let matchTime = match.time.timeOclock {
                        formattedMatchTime = String(matchTime.prefix(5))
                    }
                    
                    return MatchModel(
                        id: match.id ?? 0,
                        statusName: match.statusName ?? "Unknown",
                        date: match.time.date ?? "Unknown",
                        time: formattedMatchTime ?? "Unknown",
                        homeTeam: match.teams.home.name ?? "Unkonwn",
                        homeTeamCode: match.teams.home.nameCode ?? "UNK",
                        homeTeamId: match.teams.home.id ?? 0,
                        homeScore: homeScore,
                        awayTeam: match.teams.away.name ?? "Unknown",
                        awayTeamCode: match.teams.away.nameCode ?? "UNK",
                        awayTeamId: match.teams.away.id ?? 0,
                        awayScore: awayScore
                    )
                } ?? []
                
                completion(.success(matchesByDate))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


