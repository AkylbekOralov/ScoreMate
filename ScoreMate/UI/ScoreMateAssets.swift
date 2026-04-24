//
//  ScoreMateAssets.swift
//  ScoreMate
//
//  Created by Codex on 24.04.2026.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

typealias SmColors = ScoreMateAsset.Colors
typealias SmImages = ScoreMateAsset.Images

enum ScoreMateAsset: Sendable {
    enum Colors {
        static let accentColor = ScoreMateColorAsset(name: "AccentColor")
        static let aLeague = ScoreMateColorAsset(name: "ALeague")
        static let actionButtonBackground = ScoreMateColorAsset(name: "ActionButtonBackground")
        static let actionButtonText = ScoreMateColorAsset(name: "ActionButtonText")
        static let appBackground = ScoreMateColorAsset(name: "AppBackground")
        static let backButtonTint = ScoreMateColorAsset(name: "BackButtonTint")
        static let cardBackgroundDark = ScoreMateColorAsset(name: "CardBackgroundDark")
        static let cardBackgroundLight = ScoreMateColorAsset(name: "CardBackgroundLight")
        static let cardShadow = ScoreMateColorAsset(name: "CardShadow")
        static let errorText = ScoreMateColorAsset(name: "ErrorText")
        static let inactiveText = ScoreMateColorAsset(name: "InactiveText")
        static let inverseText = ScoreMateColorAsset(name: "InverseText")
        static let matchFilterTabDark = ScoreMateColorAsset(name: "MatchFilterTabDark")
        static let matchFilterTabLight = ScoreMateColorAsset(name: "MatchFilterTabLight")
        static let matchesHeaderBackground = ScoreMateColorAsset(name: "MatchesHeaderBackground")
        static let matchesHeaderDivider = ScoreMateColorAsset(name: "MatchesHeaderDivider")
        static let primaryText = ScoreMateColorAsset(name: "PrimaryText")
        static let secondaryText = ScoreMateColorAsset(name: "SecondaryText")
        static let selectionAccent = ScoreMateColorAsset(name: "SelectionAccent")
        static let superLiga = ScoreMateColorAsset(name: "SuperLiga")
        static let tableDivider = ScoreMateColorAsset(name: "TableDivider")
        static let teamMatchesScreenTopDark = ScoreMateColorAsset(name: "TeamMatchesScreenTopDark")
        static let teamMatchesScreenTopLight = ScoreMateColorAsset(name: "TeamMatchesScreenTopLight")
        static let tipicoBundesliga = ScoreMateColorAsset(name: "TipicoBundesliga")
        static let selectorBackground = ScoreMateColorAsset(name: "SelectorBackground")
    }

    enum Images {
        static let backButton = ScoreMateImageAsset(name: "backButton")
        static let chevronForward = ScoreMateImageAsset(name: "chevronForward")
        static let football23 = ScoreMateImageAsset(name: "football23")
        static let stadium = ScoreMateImageAsset(name: "Stadium")
        static let unknownCountry = ScoreMateImageAsset(name: "UnknownCountry")
        static let unknownTeam = ScoreMateImageAsset(name: "UnknownTeam")
    }
}

struct ScoreMateColorAsset: Sendable {
    let name: String

    #if canImport(UIKit)
    var color: UIColor {
        guard let color = UIColor(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }
    #endif

    @available(iOS 13.0, *)
    var swiftUIColor: Color {
        Color(asset: self)
    }
}

#if canImport(UIKit)
private extension UIColor {
    convenience init?(asset: ScoreMateColorAsset) {
        self.init(named: asset.name)
    }
}
#endif

@available(iOS 13.0, *)
extension Color {
    init(asset: ScoreMateColorAsset) {
        self.init(asset.name)
    }
}

struct ScoreMateImageAsset: Sendable {
    let name: String

    #if canImport(UIKit)
    var image: UIImage {
        guard let image = UIImage(named: name) else {
            fatalError("Unable to load image asset named \(name).")
        }
        return image
    }
    #endif

    @available(iOS 13.0, *)
    var swiftUIImage: Image {
        Image(asset: self)
    }
}

@available(iOS 13.0, *)
extension Image {
    init(asset: ScoreMateImageAsset) {
        self.init(asset.name)
    }

    init(decorative asset: ScoreMateImageAsset) {
        self.init(decorative: asset.name)
    }
}
