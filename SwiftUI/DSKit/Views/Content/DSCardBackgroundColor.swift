//
//  DSCardBackgroundColor.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardBackgroundColor: EnvironmentKey {
    static let defaultValue: DSColor = .secondaryViewBackground
}

extension EnvironmentValues {
    var cardBackgroundColor: DSColor {
        get { self[DSCardBackgroundColor.self] }
        set { self[DSCardBackgroundColor.self] = newValue }
    }
}

public extension View {
    func dsContentBackgroundColor(_ color: DSColor) -> some View {
        self.environment(\.cardBackgroundColor, color)
    }
}
