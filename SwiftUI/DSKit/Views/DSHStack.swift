//
//  DSHStack.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSHStack<Content: View>: View {

    @Environment(\.appearance) var appearance: DSAppearance
    
    let spacing: DSSpace
    let content: () -> Content
    let alignment: VerticalAlignment
    
    public init(
        alignment: VerticalAlignment = .center,
        spacing: DSSpace = .regular,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.spacing = spacing
        self.alignment = alignment
    }

    public var body: some View {
        HStack(alignment: alignment, spacing: appearance.spacing.value(for: spacing)) {
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
