//
//  DSColorModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import SwiftUI

struct DSColorModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSViewStyle
    let tint: DSColor
    func body(content: Content) -> some View {
        content
            .foregroundColor(tint.styledColorDemo(from: appearance, and: colorGroup).color)
    }
}

extension View {
    func setTint(tint: DSColor) -> some View {
        self.modifier(DSColorModifier(tint: tint))
    }
}

extension Image {
    func setImageTint(tint: DSColor?) -> AnyView {
        if let tint {
            return AnyView(self
                .renderingMode(.template)
                .setTint(tint: tint))
        } else {
            return AnyView(self)
        }
    }
}
