//
//  Colors.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

final class Colors: ObservableObject {
    static let shared = Colors()
    
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
            return .white
        case .dark:
            return Color(.systemGray6)
        case .system:
            return colorScheme == .dark ? Color(.systemGray6) : .white
        }
    }
    
    var aLeague: Color = Color(red: 1, green: 0.45, blue: 0.21)
    var tipicoBundusligo: Color = Color(red: 0.84, green: 0.13, blue: 0.17)
    var superLiga: Color = Color(red: 0, green: 0.35, blue: 0.61)
    
    func leagueAccentColor(name: String) -> Color {
        switch name {
        case "A-League":
            return aLeague
        case "Tipico Bundesliga":
            return tipicoBundusligo
        case "Superliga":
            return superLiga
        default:
            return superLiga
        }
    }
    
    var teamMathcesScreenTop: Color {
        switch selectedTheme {
        case .light:
            return Color(red: 0.88, green: 0.91, blue: 0.93)
        case .dark:
            return Color(.systemGray6)
        case .system:
            return colorScheme == .dark ? Color(.systemGray6) : Color(red: 0.88, green: 0.91, blue: 0.93)
        }
    }
    
    var matchFilterTab: Color {
        switch selectedTheme {
        case .light:
            return Color(red: 0.96, green: 0.96, blue: 0.96)
        case .dark:
            return Color(.systemGray6)
        case .system:
            return colorScheme == .dark ? Color(.systemGray6) : Color(red: 0.96, green: 0.96, blue: 0.96)
        }
    }
    
    private var colorScheme: ColorScheme {
        UITraitCollection.current.userInterfaceStyle == .dark ? .dark : .light
    }
}
