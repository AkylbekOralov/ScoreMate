//
//  MatchesByDateService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 05.03.2025.
//

protocol MatchesByDateServicing: Sendable {
    func fetchMatchesByDate(date: String, completion: @escaping (Result<[MatchModel], APIError>) -> Void)
}

final class MatchesByDateService: MatchesByDateServicing {
    private let apiEndpoints: APIEndpointsProviding
    private let networkService: NetworkServing

    init(apiEndpoints: APIEndpointsProviding, networkService: NetworkServing) {
        self.apiEndpoints = apiEndpoints
        self.networkService = networkService
    }

    func fetchMatchesByDate(date: String, completion: @escaping (Result<[MatchModel], APIError>) -> Void)  {
        let url = apiEndpoints.matchesByDate(date: date)
        
        networkService.getData(
            url: url,
            dataType: TeamMatchesResponse.self,
            mockFileName: "matches_by_date"
        ) { result in
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
                        leagueName: match.league?.name ?? "Unknown league",
                        leagueCountryName: match.league?.countryName ?? "Unknown country",
                        groupName: match.groupName ?? "Unknown group",
                        stageName: match.stageName ?? "Unknown stage",
                        roundName: match.roundName ?? "-",
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
