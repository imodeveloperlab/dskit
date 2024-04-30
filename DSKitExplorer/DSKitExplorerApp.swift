//
//  DSKitExplorerApp.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 20.02.2023.
//

import DSKit
import SwiftUI

@main
struct DSKitCoreExplorerApp: App {
    
    var screenshotMode: String? {
        ProcessInfo.processInfo.environment["screenshot"]
    }
    
    var body: some Scene {
        WindowGroup {
            if let screen = screenshotMode,
               let screenKey = ScreenKey(rawValue: screen) {
                NavigationView {
                    ScreenView(screen: screenKey)
                }
            } else {
                AppearanceSelectionView()
            }
        }
    }
}
