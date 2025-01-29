//
//  LeagueView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueView: View {
    var country: String = ""
    var league: String = ""
    
    var body: some View {
        HStack(spacing: 20) {
            Image(country)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                
            VStack(alignment: .leading) {
                Text(country)
                    .font(.caption)
                Text(league)
                    .font(.headline)
            }
        }
        
    }
}
