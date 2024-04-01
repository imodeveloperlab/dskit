//
//  DSCardHorizontalPaddingKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardHorizontalPaddingKey: EnvironmentKey {
    static let defaultValue: DSSpace = .medium
}

extension EnvironmentValues {
    var cardHorizontalPadding: DSSpace {
        get { self[DSCardHorizontalPaddingKey.self] }
        set { self[DSCardHorizontalPaddingKey.self] = newValue }
    }
}


