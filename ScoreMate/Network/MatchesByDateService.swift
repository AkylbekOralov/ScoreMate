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

struct TeamMatchesAPIResponse: Decodable {
    let data: [MatchData]?
}

struct MatchData: Decodable {
    let id: Int?
    let statusName: String?
    let time: Time
    let teams: Teams
    let scores: Scores
    
    enum CodingKeys: String, CodingKey {
        case id
        case statusName = "status_name"
        case time
        case teams
        case scores
    }
}

struct Time: Decodable {
    let date: String?
    let timeOclock: String?
    
    enum CodingKeys: String, CodingKey {
        case date
        case timeOclock = "time"
    }
}

struct Teams: Decodable {
    let home: TeamInfo
    let away: TeamInfo
}

struct TeamInfo: Decodable {
    let id: Int?
    let name: String?
    let nameCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameCode = "short_code"
    }
}

struct Scores: Decodable {
    let homeScore: String?
    let awayScore: String?
    
    enum CodingKeys: String, CodingKey {
        case homeScore = "home_score"
        case awayScore = "away_score"
    }
}

