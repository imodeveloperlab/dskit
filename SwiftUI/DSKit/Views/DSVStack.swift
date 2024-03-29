//
//  DSStackView.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSVStack<Content: View>: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    
    let spacing: DSDimension
    let alignment: HorizontalAlignment
    let content: () -> Content
    
    public init(
        alignment: HorizontalAlignment = .leading,
        spacing: DSDimension = .small,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.spacing = spacing
        self.alignment = alignment
    }
    
    public var body: some View {
        VStack(alignment: alignment, spacing: appearance.size.number(for: spacing)) {
            content()
                .dsDebuggable(debugColor: Color.mint)
                .dsResetContentMargins()
        }.dsContentMargins()
    }
}

public struct TestableDSVStack: View {
    public var body: some View {
        DSPreview {
            DSHStack {
                DSVStack(spacing: .extraSmall) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("1") })
                DSVStack(spacing: .smaller) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("2") })
                DSVStack(spacing: .small) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("3") })
                DSVStack(spacing: .regular) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("4") })
                DSVStack(spacing: .medium) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("5") })
                DSVStack(spacing: .mediumLarge) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("6") })
                DSVStack(spacing: .large) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("7") })
                DSVStack(spacing: .extraLarge) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("8") })
                DSVStack(spacing: .larger) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { DSText("9") })
                DSVStack(spacing: .largest) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("10") })
            }
        }
    }
}

struct DSVStack_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            DSPreview {
                TestableDSVStack()
            }
        }
    }
}
