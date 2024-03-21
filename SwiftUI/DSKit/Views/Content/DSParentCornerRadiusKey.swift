//
//  DSParentCornerRadiusKey.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import SwiftUI

struct DSParentCornerRadiusKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var parentCornerRadius: CGFloat {
        get { self[DSParentCornerRadiusKey.self] }
        set { self[DSParentCornerRadiusKey.self] = newValue }
    }
}
