//
//  DSCardHorizontalPaddingKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardHorizontalPaddingKey: EnvironmentKey {
    static let defaultValue: DSDimension = .regular
}

extension EnvironmentValues {
    var cardHorizontalPadding: DSDimension {
        get { self[DSCardHorizontalPaddingKey.self] }
        set { self[DSCardHorizontalPaddingKey.self] = newValue }
    }
}


