//
//  DSCardStyleModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSCardStyleModifier: ViewModifier {    
    
    let padding: DSPadding
    
    public init(padding: DSPadding) {
        self.padding = padding
    }
    
    public func body(content: Content) -> some View {
        content
            .dsPadding(padding)
            .dsSecondaryBackground()
            .dsCornerRadius()
    }
}

public extension View {
    func dsCardStyle(padding: DSPadding = .medium) -> some View {
        return self.modifier(DSCardStyleModifier(padding: padding))
    }
}
