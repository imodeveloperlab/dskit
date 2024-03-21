//
//  DSCardContentHeightKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSCardContentHeightKey: EnvironmentKey {
    static let defaultValue: DSDimension = .none
}

extension EnvironmentValues {
    var cardContentHeight: DSDimension {
        get { self[DSCardContentHeightKey.self] }
        set { self[DSCardContentHeightKey.self] = newValue }
    }
}

public extension View {
    func dsCardContentHeight(_ height: DSDimension) -> some View {
        self.environment(\.cardContentHeight, height)
    }
}
