//
//  DSTintColorModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import SwiftUI

public enum DSTintColor {
    case none
    case color(DSColor)
    case text(DSTextColor)
    case custom(UIColor)
    case customColor(Color)
}

extension DSTintColor: Equatable {
    public static func ==(lhs: DSTintColor, rhs: DSTintColor) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.color(let a), .color(let b)):
            return a == b
        case (.text(let a), .text(let b)):
            return a == b
        case (.custom(let a), .custom(let b)):
            return a == b
        case (.customColor(let a), .customColor(let b)):
            return a == b
        default:
            return false
        }
    }
}

struct DSTintColorModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.colorGroup) var colorGroup: DSColorGroup
    
    let tint: DSTintColor

    func body(content: Content) -> some View {
        switch tint {
        case .text(let textColor):
            content
                .foregroundColor(Color(uiColor: textColor.getColor(appearance: appearance, colorGroup: colorGroup)))
        case .custom(let uiColor):
            content.foregroundColor(Color(uiColor: uiColor))
        case .none:
            content
        case .customColor(let color):
            content.foregroundColor(color)
        case .color(let color):
            content.foregroundColor(Color(uiColor: color.color(from: appearance)))
        }
    }
}

extension View {
    func setTint(tint: DSTintColor) -> some View {
        self.modifier(DSTintColorModifier(tint: tint))
    }
}

extension Image {
    func setImageTint(tint: DSTintColor) -> AnyView {
        if tint == .none {
           return AnyView(self)
        } else {
            return AnyView(self
                .renderingMode(.template)
                .setTint(tint: tint))
        }
    }
}
