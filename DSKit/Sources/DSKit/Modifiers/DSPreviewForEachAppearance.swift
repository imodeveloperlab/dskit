//
//  DSPreviewForEachAppearance.swift
//  DSKit
//
//  Created by Ivan Borinschi on 20.02.2023.
//

import SwiftUI

// A generic structure that provides a way to
// preview content for different languages and brands.
public struct DSPreviewForEachAppearance<Content: View>: View {
    
    var content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        ForEach(appearances, id: \.self.title) { configuration in
            self.content()
                .onAppear { configuration.appearance.overrideTheSystemAppearance() }
                .environment(\.appearance, configuration.appearance)
                .environment(\.viewStyle, .primary)
                .previewDisplayName(configuration.title)
        }
    }
}

fileprivate let appearances: [(title: String, appearance: DSAppearance)] = [
    ("DSKit", DSKitAppearance()),
    ("Dark", DarkAppearance()),
    ("Blue", BlueAppearance()),
    ("Retro", RetroAppearance()),
    ("Peach", PeachAppearance())
]
