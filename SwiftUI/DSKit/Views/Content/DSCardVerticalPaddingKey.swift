//
//  DSCardVerticalPaddingKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardVerticalPaddingKey: EnvironmentKey {
    static let defaultValue: DSDimension = .regular
}

extension EnvironmentValues {
    var cardVerticalPadding: DSDimension {
        get { self[DSCardVerticalPaddingKey.self] }
        set { self[DSCardVerticalPaddingKey.self] = newValue }
    }
}
