//
//  DSCornerRadiusModifier.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

struct DSParentCornerRadiusKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var parentCornerRadius: CGFloat {
        get { self[DSParentCornerRadiusKey.self] }
        set { self[DSParentCornerRadiusKey.self] = newValue }
    }
}

public struct DSCornerRadiusModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    
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
            return viewStyle.colors(from: appearance).cornerRadius
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
                        .dsBackground(.color(.yellow))
                        .dsCornerRadius()
                    }
                    .dsPadding(3)
                    .dsBackground(.color(.blue))
                    .dsCornerRadius()
                }
                .dsPadding(3)
                .dsBackground(.color(.green))
                .dsCornerRadius()
            }
            .dsPadding(2)
            .dsBackground(.color(.red))
            .dsCornerRadius()
        }
        .dsPadding()
        .dsBackground(.primary)
    }
}

#Preview {
    Testable_DSCornerRadiusModifier()
}
