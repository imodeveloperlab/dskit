//
//  DSDebugLayoutModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 22.02.2023.
//

import SwiftUI

public struct DSDebugLayoutModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .environment(\.debugLayout, true)
    }
}

public extension View {
    func dsLayoutDebug() -> some View {
        return self.modifier(DSDebugLayoutModifier())
    }
}
