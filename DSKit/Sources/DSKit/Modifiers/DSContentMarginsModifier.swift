//
//  DSCardStyleModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSContentMarginModifier: ViewModifier {
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.dsContentMarginKey) var contentMargin: CGFloat
    let customMargins: CGFloat?
    public func body(content: Content) -> some View {
        content
            .environment(\.dsContentMarginKey, customMargins ?? appearance.screenMargins)
            .environment(\.dsScrollableContentMarginKey, customMargins ?? appearance.screenMargins)
            .padding(.horizontal, contentMargin)
    }
}

public struct DSContentMarginKey: EnvironmentKey {
    public static let defaultValue: CGFloat = .zero
}

public extension EnvironmentValues {
    var dsContentMarginKey: CGFloat {
        get { self[DSContentMarginKey.self] }
        set { self[DSContentMarginKey.self] = newValue }
    }
}

public extension View {
    
    func dsContentMargins(margin: CGFloat? = nil) -> some View {
        return self
            .modifier(DSContentMarginModifier(customMargins: margin))
    }
    
    func dsResetContentMargins() -> some View {
        return self.environment(\.dsContentMarginKey, .zero)
    }
}
