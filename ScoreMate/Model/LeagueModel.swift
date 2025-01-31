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
    var country: String
    var countryID: Int
    
    init(id: Int, name: String, country: String, country_id: Int) {
        self.id = id
        self.name = name
        self.country = country
        self.countryID = country_id
    }
}

