//
//  DSButtonModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 19.02.2023.
//

import SwiftUI

public struct DSButtonModifier: ViewModifier {
    var action: () -> Void
    public func body(content: Content) -> some View {
        Button(action: action, label: { content })
    }
}

public extension View {
    func onTap(action: @escaping () -> Void) -> some View {
        self.modifier(DSButtonModifier(action: action))
    }
}
