//
//  MatchModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import Foundation

struct MatchModel: Identifiable {
    let id: Int
    let statusName: String
    let date: String
    let time: String
    let homeTeam: String
    let homeTeamId: Int
    let homeScore: Int
    let awayTeam: String
    let awayTeamId: Int
    let awayScore: Int
}
