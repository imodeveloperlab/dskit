//
//  DSColorModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import SwiftUI

struct DSColorModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    let tint: DSColorKey
    func body(content: Content) -> some View {
        content
            .foregroundColor(tint.color(for: appearance, and: viewStyle))
    }
}

extension View {
    func setTint(tint: DSColorKey) -> some View {
        self.modifier(DSColorModifier(tint: tint))
    }
}

extension Image {
    func setImageTint(tint: DSColorKey?) -> AnyView {
        if let tint {
            return AnyView(self
                .renderingMode(.template)
                .setTint(tint: tint))
        } else {
            return AnyView(self)
        }
    }
}
