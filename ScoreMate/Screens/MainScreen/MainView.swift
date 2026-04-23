//
//  MainView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI
import UIKit
import FactoryKit

private struct ShakeDetector: UIViewControllerRepresentable {
    let onShake: () -> Void

    func makeUIViewController(context: Context) -> ShakeDetectorViewController {
        let controller = ShakeDetectorViewController()
        controller.onShake = onShake
        return controller
    }

    func updateUIViewController(_ uiViewController: ShakeDetectorViewController, context: Context) {
        uiViewController.onShake = onShake
    }
}

private final class ShakeDetectorViewController: UIViewController {
    var onShake: (() -> Void)?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        becomeFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)

        guard motion == .motionShake else { return }
        onShake?()
    }
}

struct MainView: View {
    @State var leaguesViewModel = LeaguesViewModel()
    @State var mathesByDateViewModel = MatchesByDateViewModel()
    @AppStorage("selectedTheme") private var selectedTheme: AppTheme = .system
    @Injected(\.colors) private var colors: Colors
    
    var body: some View {
        TabView {
            LeaguesView(leaguesViewModel: leaguesViewModel)
                .tabItem {
                    Label("Leagues", systemImage: "trophy")
                }
            
            MatchesByDateView(mathesByDateViewModel: mathesByDateViewModel)
                .tabItem {
                    Label("Matches", systemImage: "soccerball")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(colors.primaryText)
        .preferredColorScheme(selectedTheme.colorScheme)
        .background {
            #if DEBUG
            ShakeDetector {
                (UIApplication.shared.delegate as? AppDelegate)?.toggleDebugSwift()
            }
            .allowsHitTesting(false)
            #endif
        }
    }
}
