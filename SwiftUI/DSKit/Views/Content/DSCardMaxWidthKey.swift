//
//  DSCardMaxWidthKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardMaxWidthKey: EnvironmentKey {
    static let defaultValue: Bool = true
}

extension EnvironmentValues {
    var contentMaxWidth: Bool {
        get { self[DSCardMaxWidthKey.self] }
        set { self[DSCardMaxWidthKey.self] = newValue }
    }
}

public extension View {
    func dsCardUseMaxWidth(_ useMaxWidth: Bool) -> some View {
        self.environment(\.contentMaxWidth, useMaxWidth)
    }
}
