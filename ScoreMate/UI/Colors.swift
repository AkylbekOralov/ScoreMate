//
//  Colors.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

@MainActor
final class Colors: ObservableObject {
    @AppStorage("selectedTheme") private var storedTheme: String = AppTheme.system.rawValue {
        didSet {
            objectWillChange.send()
        }
    }
    
    var selectedTheme: AppTheme {
        AppTheme(rawValue: storedTheme) ?? .system
    }

    var appBackground: Color {
        Color(AssetName.appBackground)
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

    var primaryText: Color {
        Color(AssetName.primaryText)
    }

    var inverseText: Color {
        Color(AssetName.inverseText)
    }

    var secondaryText: Color {
        Color(AssetName.secondaryText)
    }

    var inactiveText: Color {
        Color(AssetName.inactiveText)
    }

    var selectionAccent: Color {
        Color(AssetName.selectionAccent)
    }

    var tableDivider: Color {
        Color(AssetName.tableDivider)
    }

    var matchesHeaderBackground: Color {
        Color(AssetName.matchesHeaderBackground)
    }

    var matchesHeaderDivider: Color {
        Color(AssetName.matchesHeaderDivider)
    }

    var errorText: Color {
        Color(AssetName.errorText)
    }

    var actionButtonBackground: Color {
        Color(AssetName.actionButtonBackground)
    }

    var actionButtonText: Color {
        Color(AssetName.actionButtonText)
    }

    var cardShadow: Color {
        Color(AssetName.cardShadow)
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
    
    var teamMatchesScreenTop: Color {
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
