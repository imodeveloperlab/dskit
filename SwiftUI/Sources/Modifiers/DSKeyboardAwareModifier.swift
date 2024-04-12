//
//  DSKeyboardAwareModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI

public struct DSKeyboardAwareModifier: ViewModifier {
    
    @ObservedObject var keyboard = KeyboardObserver.shared
    var hide: Bool
    var transition: AnyTransition
    
    public func body(content: Content) -> some View {
        if hide {
            if !keyboard.isDisplayed {
                content.transition(transition)
            }
        } else if keyboard.isDisplayed {
            content.transition(transition)
        }
    }
}

public extension View {
    func hideWhenKeyboardIsDisplayed(transition: AnyTransition = .opacity) -> some View {
        self.modifier(DSKeyboardAwareModifier(hide: true, transition: transition))
    }
    
    func showWhenKeyboardIsDisplayed(transition: AnyTransition = .opacity) -> some View {
        self.modifier(DSKeyboardAwareModifier(hide: false, transition: transition))
    }
}
