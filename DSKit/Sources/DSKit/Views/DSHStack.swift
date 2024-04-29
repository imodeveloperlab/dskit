//
//  DSHStack.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI

/*
## DSHStack

`DSHStack` is a SwiftUI component designed to lay out child views in a horizontal line within the DSKit framework. It extends SwiftUI's `HStack` but includes additional design system specifications such as spacing adjustments based on the current appearance settings.

#### Initialization:
Initializes a `DSHStack` with alignment, spacing, and dynamic content.
- Parameters:
- `alignment`: The vertical alignment of content within the stack. Defaults to `.center`.
- `spacing`: Specifies the space between each item within the stack. Defaults to `.regular`.
- `content`: A `@ViewBuilder` closure that generates the content of the stack.

#### Usage:
`DSHStack` is particularly useful for creating layouts where horizontal arrangement of components is required, maintaining consistency with the design system’s spacing and alignment guidelines.
*/

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

struct Testable_DSHStack: View {
    var body: some View {
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
        }.dsHeight(300)
    }
}

struct DSHStack_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSHStack()
            }
        }
    }
}
