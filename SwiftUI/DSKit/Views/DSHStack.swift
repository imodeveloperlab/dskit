//
//  DSHStack.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSHStack<Content: View>: View {

    @Environment(\.appearance) var appearance: DSAppearance
    
    let spacing: DSSpacingDimension
    let content: () -> Content
    let alignment: VerticalAlignment
    
    public init(
        alignment: VerticalAlignment = .center,
        spacing: DSSpacingDimension = .regular,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.spacing = spacing
        self.alignment = alignment
    }

    public var body: some View {
        HStack(alignment: alignment, spacing: appearance.size.number(for: spacing)) {
            content()
                .dsDebuggable(debugColor: Color.purple)
                .dsResetContentMargins()
        }.dsContentMargins()
    }
}

public struct TestableDSHStack: View {
    public var body: some View {
        DSPreview {
            DSVStack {
                DSHStack(spacing: .small) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("2") })
                DSHStack(spacing: .regular) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("3") })
                DSHStack(spacing: .medium) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("4") })
                DSHStack(spacing: .large) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("5") })
                DSHStack(spacing: .mediumLarge) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("6") })
                DSHStack(spacing: .largexxxxx) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("7") })
                DSHStack(spacing: .extraLarge) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("8") })
                DSHStack(spacing: .larger) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("9") })
                DSHStack(spacing: .largest) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("10") })
            }
        }
    }
}

struct DSHStack_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { TestableDSHStack()
        }
    }
}
