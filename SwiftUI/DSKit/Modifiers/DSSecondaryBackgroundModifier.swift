//
//  DSSecondaryBackgroundModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import SwiftUI

public struct DSSecondaryBackgroundModifier: ViewModifier {
    
    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .dsBackground()
            .environment(\.colorGroup, .secondary)
    }
}

public extension View {
    func dsSecondaryBackground() -> some View {
        self.modifier(DSSecondaryBackgroundModifier())
    }
}
