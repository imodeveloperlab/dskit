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
    public func body(content: Content) -> some View {
        content
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

public struct DSScrollableContentMarginKey: EnvironmentKey {
    public static let defaultValue: CGFloat = .zero
}

public extension EnvironmentValues {
    var dsScrollableContentMarginKey: CGFloat {
        get { self[DSScrollableContentMarginKey.self] }
        set { self[DSScrollableContentMarginKey.self] = newValue }
    }
}

public extension View {
    
    func dsContentMargins(margin: CGFloat = .zero) -> some View {
        return self
            .environment(\.dsContentMarginKey, margin)
            .environment(\.dsScrollableContentMarginKey, margin)
            .modifier(DSContentMarginModifier())
    }
    
    func dsResetContentMargins() -> some View {
        return self.environment(\.dsContentMarginKey, .zero)
    }
}


