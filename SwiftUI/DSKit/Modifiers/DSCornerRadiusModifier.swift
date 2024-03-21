//
//  DSCornerRadiusModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

public struct DSCornerRadiusModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    @Environment(\.parentPadding) var parentPadding: CGFloat
    @Environment(\.parentCornerRadius) var parentCornerRadius: CGFloat
    
    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(resolveCornerRadius())
            .environment(\.parentCornerRadius,  resolveCornerRadius())
    }
    
    func resolveCornerRadius() -> CGFloat {
        if parentCornerRadius == 0 {
            return colorGroup.colors(from: appearance).cornerRadius
        } else {
            return max(parentCornerRadius - parentPadding, 2)
        }
    }
}

public extension View {
    func dsCornerRadius() -> some View {
        let modifier = DSCornerRadiusModifier()
        return self.modifier(modifier)
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
