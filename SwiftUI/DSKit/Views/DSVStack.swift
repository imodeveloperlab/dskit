//
//  DSStackView.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

public struct DSVStack<Content: View>: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    
    let spacing: DSSpace
    let alignment: HorizontalAlignment
    let content: () -> Content
    
    public init(
        alignment: HorizontalAlignment = .leading,
        spacing: DSSpace = .regular,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.spacing = spacing
        self.alignment = alignment
    }
    
    public var body: some View {
        VStack(alignment: alignment, spacing: appearance.spacing.value(for: spacing)) {
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
                DSVStack(spacing: .small) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("2") })
                DSVStack(spacing: .regular) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("3") })
                DSVStack(spacing: .medium) {
                    Color.yellow
                    Color.green
                    Color.blue
                }.overlay(alignment: .center, content: { Text("4") })
            }
        }
    }
}

struct DSVStack_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { DSPreview {
                TestableDSVStack()
            }
        }
    }
}