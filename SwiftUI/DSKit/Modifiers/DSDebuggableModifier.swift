//
//  DSDebuggableModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

public struct DSDebuggableModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
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
                .dsPadding(.regular)
                .dsSecondaryBackground()
                .dsCornerRadius()
                
            }
            .dsPadding(.extraSmall)
            .dsBackground()
            .dsCornerRadius()
        }
        .dsPadding(.smaller)
        .dsSecondaryBackground()
        .dsCornerRadius()
        
    }.dsPadding()
}
