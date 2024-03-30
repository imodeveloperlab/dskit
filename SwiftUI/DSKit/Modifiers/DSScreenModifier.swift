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
            .padding(.horizontal, appearance.size.number(for: contentMargin))
            .padding(.bottom, appearance.size.number(for: contentMargin))
    }
}

public struct DSContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSDimension = .zero
}

public extension EnvironmentValues {
    var dsContentMarginKey: DSDimension {
        get { self[DSContentMarginKey.self] }
        set { self[DSContentMarginKey.self] = newValue }
    }
}

public struct DSScrollableContentMarginKey: EnvironmentKey {
    public static let defaultValue: DSDimension = .regularMedium
}

public extension EnvironmentValues {
    var dsScrollableContentMarginKey: DSDimension {
        get { self[DSScrollableContentMarginKey.self] }
        set { self[DSScrollableContentMarginKey.self] = newValue }
    }
}

public extension View {
    
    func dsScreen(contentMargins: DSDimension = .regularMedium) -> some View {
        return self
            .dsBackground(.primary)
            .environment(\.dsContentMarginKey, contentMargins)
            .environment(\.dsScrollableContentMarginKey, contentMargins)
    }
    
    func dsContentMargins(margin: DSDimension = .regularMedium) -> some View {
        return self
            .environment(\.dsContentMarginKey, margin)
            .environment(\.dsScrollableContentMarginKey, margin)
            .modifier(DSContentMarginModifier())
    }
    func dsResetContentMargins() -> some View {
        return self.environment(\.dsContentMarginKey, .zero)
    }
}


