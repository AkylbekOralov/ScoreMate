//
//  Colors.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

@MainActor
final class Colors: ObservableObject {
    private enum AssetName {
        static let aLeague = "ALeague"
        static let tipicoBundesliga = "TipicoBundesliga"
        static let superLiga = "SuperLiga"
        static let cardBackgroundLight = "CardBackgroundLight"
        static let cardBackgroundDark = "CardBackgroundDark"
        static let teamMatchesScreenTopLight = "TeamMatchesScreenTopLight"
        static let teamMatchesScreenTopDark = "TeamMatchesScreenTopDark"
        static let matchFilterTabLight = "MatchFilterTabLight"
        static let matchFilterTabDark = "MatchFilterTabDark"
    }

    @AppStorage("selectedTheme") private var storedTheme: String = AppTheme.system.rawValue {
        didSet {
            objectWillChange.send()
        }
    }
    
    var selectedTheme: AppTheme {
        AppTheme(rawValue: storedTheme) ?? .system
    }
    
    var cardBackground: Color {
        switch selectedTheme {
        case .light:
            return Color(AssetName.cardBackgroundLight)
        case .dark:
            return Color(AssetName.cardBackgroundDark)
        case .system:
            return colorScheme == .dark
                ? Color(AssetName.cardBackgroundDark)
                : Color(AssetName.cardBackgroundLight)
        }
    }

    func leagueAccentColor(name: String) -> Color {
        switch name {
        case "A-League":
            return Color(AssetName.aLeague)
        case "Tipico Bundesliga":
            return Color(AssetName.tipicoBundesliga)
        case "Superliga":
            return Color(AssetName.superLiga)
        default:
            return Color(AssetName.superLiga)
        }
    }
    
    var teamMathcesScreenTop: Color {
        switch selectedTheme {
        case .light:
            return Color(AssetName.teamMatchesScreenTopLight)
        case .dark:
            return Color(AssetName.teamMatchesScreenTopDark)
        case .system:
            return colorScheme == .dark
                ? Color(AssetName.teamMatchesScreenTopDark)
                : Color(AssetName.teamMatchesScreenTopLight)
        }
    }
    
    var matchFilterTab: Color {
        switch selectedTheme {
        case .light:
            return Color(AssetName.matchFilterTabLight)
        case .dark:
            return Color(AssetName.matchFilterTabDark)
        case .system:
            return colorScheme == .dark
                ? Color(AssetName.matchFilterTabDark)
                : Color(AssetName.matchFilterTabLight)
        }
    }
    
    private var colorScheme: ColorScheme {
        UITraitCollection.current.userInterfaceStyle == .dark ? .dark : .light
    }
}
