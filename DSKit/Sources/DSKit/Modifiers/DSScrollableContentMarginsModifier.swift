//
//  DSScrollableContentMarginsModifier.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSScrollableContentMarginKey: EnvironmentKey {
    public static let defaultValue: CGFloat = .zero
}

public extension EnvironmentValues {
    var dsScrollableContentMarginKey: CGFloat {
        get { self[DSScrollableContentMarginKey.self] }
        set { self[DSScrollableContentMarginKey.self] = newValue }
    }
}
