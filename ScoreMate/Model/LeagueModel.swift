//
//  LeagueModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 28.01.2025.
//

import Foundation

struct LeagueModel: Identifiable {
    var id: Int
    var name: String
    var countryName: String
    var countryId: Int
    var countryCode: String
    var currentSeasonId: Int
}

