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
    
    public func body(content: Content) -> some View {
        let newCornerRadius = resolveCornerRadius()
        content
            .cornerRadius(newCornerRadius)
            .environment(\.parentCornerRadius, newCornerRadius)
    }
    
    func resolveCornerRadius() -> CGFloat {
        if parentCornerRadius == 0 {
            print("parentCornerRadius == 0", "did set \(colorGroup.colors(from: appearance).cornerRadius)", "parentPadding \(parentPadding)")
            return colorGroup.colors(from: appearance).cornerRadius
        } else {
            print("existing == \(parentCornerRadius)", "did set \(max(parentCornerRadius - parentPadding, 2))", "parentPadding \(parentPadding)")
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

struct Testable_DSCornerRadiusModifier: View {
    var body: some View {
        DSVStack {
            DSVStack {
                DSVStack {
                    DSVStack {
                        DSVStack {
                            DSText("Center")
                        }
                        .dsPadding(4)
                        .dsBackground(.custom(.yellow))
                        .dsCornerRadius()
                    }
                    .dsPadding(3)
                    .dsBackground(.custom(.blue))
                    .dsCornerRadius()
                }
                .dsPadding(3)
                .dsBackground(.custom(.green))
                .dsCornerRadius()
            }
            .dsPadding(2)
            .dsBackground(.custom(.red))
            .dsCornerRadius()
        }
        .dsPadding()
        .dsBackground()
    }
}

#Preview {
    Testable_DSCornerRadiusModifier()
}
