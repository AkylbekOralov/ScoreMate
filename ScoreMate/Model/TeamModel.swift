//
//  TeamModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 01.02.2025.
//

import Foundation

struct TeamModel: Identifiable {
    var id: Int
    var name: String
    var gamesPlayed: Int
    var goalsScored: Int
    var goalsAgainst: Int
    var points: Int
}
