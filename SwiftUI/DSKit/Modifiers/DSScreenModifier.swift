//
//  DSCardStyleModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSContentMarginModifier: ViewModifier {
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.dsContentMarginKey) var contentMargin: DSDimension
    public func body(content: Content) -> some View {
        content
            .dsPadding(.horizontal, contentMargin)
            .dsPadding(.bottom, contentMargin)
    }
}

public struct DSContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSDimension = .regular
}

public extension EnvironmentValues {
    var dsContentMarginKey: DSDimension {
        get { self[DSContentMarginKey.self] }
        set { self[DSContentMarginKey.self] = newValue }
    }
}

public struct DSScrollableContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSDimension = .regular
}

public extension EnvironmentValues {
    var dsScrollableContentMarginKey: DSDimension {
        get { self[DSScrollableContentMarginKey.self] }
        set { self[DSScrollableContentMarginKey.self] = newValue }
    }
}

public extension View {
    func dsContentMargins(margin: DSDimension = .regular) -> some View {
        return self
            .environment(\.dsContentMarginKey, margin)
            .environment(\.dsScrollableContentMarginKey, margin)
            .modifier(DSContentMarginModifier())
    }
    func dsResetContentMargins() -> some View {
        return self.environment(\.dsContentMarginKey, .zero)
    }
}
