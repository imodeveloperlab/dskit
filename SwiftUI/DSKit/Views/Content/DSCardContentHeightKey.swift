//
//  DSCardContentHeightKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardContentHeightKey: EnvironmentKey {
    static let defaultValue: DSSpacingDimension = .none
}

extension EnvironmentValues {
    var cardContentHeight: DSSpacingDimension {
        get { self[DSCardContentHeightKey.self] }
        set { self[DSCardContentHeightKey.self] = newValue }
    }
}

public extension View {
    func dsCardContentHeight(_ height: DSSpacingDimension) -> some View {
        self.environment(\.cardContentHeight, height)
    }
}
