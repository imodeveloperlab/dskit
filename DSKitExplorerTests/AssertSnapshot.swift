//
//  AssertSnapshot.swift
//  DSKitTests
//
//  Created by Ivan Borinschi on 29.03.2024.
//

import SwiftUI
import XCTest
import SnapshotTesting
import UIKit
import DSKit

extension XCTestCase {
    func assertSnapshot(
        for testView: some View,
        named: String,
        record: Bool = false,
        timeout: TimeInterval = 5,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let screenShotMode = ProcessInfo.processInfo.arguments.contains("SCREENSHOTSMODE")

        
        if screenShotMode {
            
            SnapshotTesting.diffTool = "open"
            isRecording = true
            
            for appearance in appearances {
                
                let testView = testView.environment(\.appearance, appearance.appearance)
                
                UIView.setAnimationsEnabled(false)
                let view = UIHostingController(rootView: testView)
                view.overrideUserInterfaceStyle = .light
                
                guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
                    fatalError("A key window is required for UI operations")
                }
                window.rootViewController = view
                
                SnapshotTesting.assertSnapshot(
                    matching: view,
                    as: .wait(for: screenShotMode ? 3 : 0.1 , on: .image(on: .iPhone13Pro)),
                    named: screenShotMode ? "\(appearance.title)_screenshot" : "snapshot",
                    record: record,
                    timeout: timeout,
                    file: file,
                    testName: named,
                    line: line
                )
            }
        } else {
            
            SnapshotTesting.diffTool = "open"
            let screenShotMode = ProcessInfo.processInfo.arguments.contains("SCREENSHOTSMODE")
            isRecording = false
            UIView.setAnimationsEnabled(false)
            let view = UIHostingController(rootView: testView)
            view.overrideUserInterfaceStyle = .light
            
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
                fatalError("A key window is required for UI operations")
            }
            window.rootViewController = view
            
            SnapshotTesting.assertSnapshot(
                matching: view,
                as: .wait(for: screenShotMode ? 3 : 0.1 , on: .image(on: .iPhone13Pro)),
                named: screenShotMode ? "screenshot" : "snapshot",
                record: record,
                timeout: timeout,
                file: file,
                testName: named,
                line: line
            )
        }
    }
}

fileprivate let appearances: [(title: String, appearance: DSAppearance)] = [
    ("BlackTone", BlackToneAppearance()),
    ("DarkLight", DarkLightAppearance()),
    ("Shop", ShopAppearance()),
    ("DSKit", DSKitAppearance()),
    ("Retro", RetroAppearance()),
    ("Orange", OrangeAppearance()),
    ("Peach", PeachAppearance())
]

extension ViewImageConfig {
    public static func iPhone15Pro(_ orientation: Orientation) -> ViewImageConfig {
        let safeArea: UIEdgeInsets
        let size: CGSize
        switch orientation {
        case .landscape:
            safeArea = .init(top: 0, left: 47, bottom: 21, right: 47) // Adjust these values as needed based on your design requirements
            size = .init(width: 852, height: 393) // Using provided viewport size in landscape
        case .portrait:
            safeArea = .init(top: 47, left: 0, bottom: 34, right: 0) // Adjust these values as needed
            size = .init(width: 393, height: 852) // Using provided viewport size in portrait
        }
        return .init(safeArea: safeArea, size: size, traits: .iPhone15Pro(orientation))
    }
}

extension UITraitCollection {
    public static func iPhone15Pro(_ orientation: ViewImageConfig.Orientation)
    -> UITraitCollection
    {
        let base: [UITraitCollection] = [
            .init(forceTouchCapability: .unavailable), // Assuming 3D Touch is unavailable as with most newer models
            .init(layoutDirection: .leftToRight),
            .init(preferredContentSizeCategory: .medium),
            .init(userInterfaceIdiom: .phone),
        ]
        switch orientation {
        case .landscape:
            return .init(
                traitsFrom: base + [
                    .init(horizontalSizeClass: .regular),
                    .init(verticalSizeClass: .compact),
                ]
            )
        case .portrait:
            return .init(
                traitsFrom: base + [
                    .init(horizontalSizeClass: .compact),
                    .init(verticalSizeClass: .regular),
                ]
            )
        }
    }
}
