//
//  AppTheme.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.06.2025.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case system, light, dark

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .system: return "System"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

extension AppTheme {
    func resolvedColorScheme(using systemColorScheme: ColorScheme) -> ColorScheme {
        colorScheme ?? systemColorScheme
    }

    func themedColor(
        light: ScoreMateColorAsset,
        dark: ScoreMateColorAsset,
        systemColorScheme: ColorScheme
    ) -> Color {
        resolvedColorScheme(using: systemColorScheme) == .dark ? dark.swiftUIColor : light.swiftUIColor
    }
}

extension SmColors {
    static func selectorBackground(theme: AppTheme, systemColorScheme: ColorScheme) -> Color {
        theme.themedColor(
            light: selectorBackground,
            dark: cardBackgroundDark,
            systemColorScheme: systemColorScheme
        )
    }
    
    static func cardBackground(theme: AppTheme, systemColorScheme: ColorScheme) -> Color {
        theme.themedColor(
            light: cardBackgroundLight,
            dark: cardBackgroundDark,
            systemColorScheme: systemColorScheme
        )
    }

    static func teamMatchesScreenTop(theme: AppTheme, systemColorScheme: ColorScheme) -> Color {
        theme.themedColor(
            light: teamMatchesScreenTopLight,
            dark: teamMatchesScreenTopDark,
            systemColorScheme: systemColorScheme
        )
    }

    static func matchFilterTab(theme: AppTheme, systemColorScheme: ColorScheme) -> Color {
        theme.themedColor(
            light: matchFilterTabLight,
            dark: matchFilterTabDark,
            systemColorScheme: systemColorScheme
        )
    }

    static func leagueAccentColor(name: String) -> Color {
        switch name {
        case "A-League":
            return aLeague.swiftUIColor
        case "Tipico Bundesliga":
            return tipicoBundesliga.swiftUIColor
        case "Superliga":
            return superLiga.swiftUIColor
        default:
            return superLiga.swiftUIColor
        }
    }
}
