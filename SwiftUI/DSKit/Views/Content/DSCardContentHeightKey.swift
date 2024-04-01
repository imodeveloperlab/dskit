//
//  DSCardContentHeightKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardContentHeightKey: EnvironmentKey {
    static let defaultValue: DSSpace = .zero
}

extension EnvironmentValues {
    var cardContentHeight: DSSpace {
        get { self[DSCardContentHeightKey.self] }
        set { self[DSCardContentHeightKey.self] = newValue }
    }
}

public extension View {
    func dsCardContentHeight(_ height: DSSpace) -> some View {
        self.environment(\.cardContentHeight, height)
    }
}
