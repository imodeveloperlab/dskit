//
//  DSDebuggableModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

struct LayoutEnvironment: EnvironmentKey {
    static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var debugLayout: Bool {
        get { self[LayoutEnvironment.self] }
        set { self[LayoutEnvironment.self] = newValue }
    }
}

public struct DSDebuggableModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    @Environment(\.debugLayout) var debugLayout: Bool
    
    var debugColor: Color
    
    public init(debugColor: Color) {
        self.debugColor = debugColor
    }
    
    public func body(content: Content) -> some View {
        if debugLayout {
            content.background(debugColor.opacity(0.3))
        } else {
            content
        }
    }
}

public extension View {
    func dsDebuggable(debugColor: Color) -> some View {
        return self.modifier(
            DSDebuggableModifier(
                debugColor: debugColor
            )
        )
    }
}

#Preview {
    VStack {
        DSVStack {
            DSText("Secondary")
            DSVStack {
                DSText("Primary")
                DSVStack {
                    DSText("Primary")
                }
                .dsPadding(.medium)
                .dsBackground(.secondary)
                .dsCornerRadius()
            }
            .dsPadding(.custom(1))
            .dsBackground(.primary)
            .dsCornerRadius()
        }
        .dsPadding(.small)
        .dsSecondaryBackground()
        .dsCornerRadius()
        
    }.dsPadding()
}
