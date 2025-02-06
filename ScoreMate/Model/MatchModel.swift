//
//  MatchModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation

struct MatchModel: Identifiable {
    let id: Int
    let date: String
    let homeTeam: String
    let homeTeamImage: String
    let homeScore: Int
    let awayTeam: String
    let awayTeamImage: String
    let awayScore: Int
}
