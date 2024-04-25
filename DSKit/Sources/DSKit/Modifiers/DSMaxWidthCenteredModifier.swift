//
//  DSMaxWidthCenteredModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.12.2022.
//

import SwiftUI

public struct DSMaxWidthCenteredModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .center)
    }
}

public extension View {
    func dsMaxWidthCentered() -> some View {
        self.modifier(DSMaxWidthCenteredModifier())
    }
}
