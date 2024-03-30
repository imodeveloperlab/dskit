//
//  DSCardVerticalPaddingKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardVerticalPaddingKey: EnvironmentKey {
    static let defaultValue: DSSpacingDimension = .medium
}

extension EnvironmentValues {
    var cardVerticalPadding: DSSpacingDimension {
        get { self[DSCardVerticalPaddingKey.self] }
        set { self[DSCardVerticalPaddingKey.self] = newValue }
    }
}
