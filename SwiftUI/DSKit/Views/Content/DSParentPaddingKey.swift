//
//  DSParentPaddingKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

public struct DSParentPaddingKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 0
}

public extension EnvironmentValues {
    var parentPadding: CGFloat {
        get { self[DSParentPaddingKey.self] }
        set { self[DSParentPaddingKey.self] = newValue }
    }
}
