//
//  DSHideKeyboardWhenTappedModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI

public struct DSHideKeyboardWhenTappedModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle

    public func body(content: Content) -> some View {
        ZStack {
            // Invisible touch layer
            viewStyle.colors(from: appearance).background.color
                .onTapGesture {
                    self.dismissKeyboard()
                }
                .zIndex(-1) // Ensure it doesn't interfere with other UI elements
            content
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

public extension View {
    func hideKeyboardWhenTappedOutside() -> some View {
        self.modifier(DSHideKeyboardWhenTappedModifier())
    }
}


