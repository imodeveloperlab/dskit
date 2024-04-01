//
//  DSCardStyleModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSContentMarginModifier: ViewModifier {
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.dsContentMarginKey) var contentMargin: DSSpace
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, appearance.spacing.value(for: contentMargin))
            .padding(.bottom, appearance.spacing.value(for: contentMargin))
    }
}

public struct DSContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSSpace = .zero
}

public extension EnvironmentValues {
    var dsContentMarginKey: DSSpace {
        get { self[DSContentMarginKey.self] }
        set { self[DSContentMarginKey.self] = newValue }
    }
}

public struct DSScrollableContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSSpace = .medium
}

public extension EnvironmentValues {
    var dsScrollableContentMarginKey: DSSpace {
        get { self[DSScrollableContentMarginKey.self] }
        set { self[DSScrollableContentMarginKey.self] = newValue }
    }
}

public extension View {
    
    func dsScreen(contentMargins: DSSpace = .medium) -> some View {
        return self
            .dsBackground(.primary)
            .environment(\.dsContentMarginKey, contentMargins)
            .environment(\.dsScrollableContentMarginKey, contentMargins)
    }
    
    func dsContentMargins(margin: DSSpace = .medium) -> some View {
        return self
            .environment(\.dsContentMarginKey, margin)
            .environment(\.dsScrollableContentMarginKey, margin)
            .modifier(DSContentMarginModifier())
    }
    func dsResetContentMargins() -> some View {
        return self.environment(\.dsContentMarginKey, .zero)
    }
}


