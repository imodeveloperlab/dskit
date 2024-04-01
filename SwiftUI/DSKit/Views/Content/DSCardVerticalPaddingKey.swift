//
//  DSCardVerticalPaddingKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardVerticalPaddingKey: EnvironmentKey {
    static let defaultValue: DSSpace = .medium
}

extension EnvironmentValues {
    var cardVerticalPadding: DSSpace {
        get { self[DSCardVerticalPaddingKey.self] }
        set { self[DSCardVerticalPaddingKey.self] = newValue }
    }
}
