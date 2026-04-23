//
//  ScoreMateApp.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 23.01.2025.
//

import SwiftUI
import UIKit

#if canImport(DebugSwift)
import DebugSwift
#endif

final class AppDelegate: NSObject, UIApplicationDelegate {
    #if DEBUG
    let debugSwift = DebugSwift()
    #endif

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        #if DEBUG
        debugSwift.setup()
        debugSwift.show()
        #endif

        return true
    }

    #if DEBUG
    func toggleDebugSwift() {
        debugSwift.toggle()
    }
    #endif
}

@main
struct ScoreMateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
