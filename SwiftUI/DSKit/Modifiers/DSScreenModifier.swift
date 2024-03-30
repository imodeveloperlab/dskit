//
//  DSCardStyleModifier.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSContentMarginModifier: ViewModifier {
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.dsContentMarginKey) var contentMargin: DSSpacingDimension
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, appearance.size.number(for: contentMargin))
            .padding(.bottom, appearance.size.number(for: contentMargin))
    }
}

public struct DSContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSSpacingDimension = .zero
}

public extension EnvironmentValues {
    var dsContentMarginKey: DSSpacingDimension {
        get { self[DSContentMarginKey.self] }
        set { self[DSContentMarginKey.self] = newValue }
    }
}

public struct DSScrollableContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSSpacingDimension = .medium
}

public extension EnvironmentValues {
    var dsScrollableContentMarginKey: DSSpacingDimension {
        get { self[DSScrollableContentMarginKey.self] }
        set { self[DSScrollableContentMarginKey.self] = newValue }
    }
}

public extension View {
    
    func dsScreen(contentMargins: DSSpacingDimension = .medium) -> some View {
        return self
            .dsBackground(.primary)
            .environment(\.dsContentMarginKey, contentMargins)
            .environment(\.dsScrollableContentMarginKey, contentMargins)
    }
    
    func dsContentMargins(margin: DSSpacingDimension = .medium) -> some View {
        return self
            .environment(\.dsContentMarginKey, margin)
            .environment(\.dsScrollableContentMarginKey, margin)
            .modifier(DSContentMarginModifier())
    }
    func dsResetContentMargins() -> some View {
        return self.environment(\.dsContentMarginKey, .zero)
    }
}


