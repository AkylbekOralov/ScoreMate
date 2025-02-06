//
//  TeamMatchesView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 06.02.2025.
//

import SwiftUI

struct TeamMatchesView: View {
    var body: some View {
        TeamInfoView()
        MatchLeagueView()
        MatchView()
        Rectangle().fill(Color.gray.opacity(0.1)).frame(height: 2)
        MatchView()
        MatchLeagueView()
        MatchView()
        Spacer()
    }
}

#Preview {
    TeamMatchesView()
}
