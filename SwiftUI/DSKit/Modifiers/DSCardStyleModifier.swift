//
//  DSCardStyleModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSCardStyleModifier: ViewModifier {    
    
    let padding: DSSpacingDimension
    
    public init(padding: DSSpacingDimension) {
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
    func dsCardStyle(padding: DSSpacingDimension = .medium) -> some View {
        return self.modifier(DSCardStyleModifier(padding: padding))
    }
}
