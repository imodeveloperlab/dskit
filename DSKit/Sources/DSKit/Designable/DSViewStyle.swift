//
//  DSViewStyle.swift
//  DSKit
//
//  Created by Ivan Borinschi on 02.04.2024.
//

import SwiftUI

struct AppearanceViewStyleEnvironment: EnvironmentKey {
    static let defaultValue: DSViewStyle = .primary
}

public extension EnvironmentValues {
    var viewStyle: DSViewStyle {
        get { self[AppearanceViewStyleEnvironment.self] }
        set { self[AppearanceViewStyleEnvironment.self] = newValue }
    }
}

public enum DSViewStyle: Equatable {
    case primary
    case secondary
}

public extension DSViewStyle {
    func colors(from appearance: DSAppearance) -> DSViewAppearanceProtocol {
        switch self {
        case .primary:
            return appearance.primaryView
        case .secondary:
            return appearance.secondaryView
        }
    }
}

extension DSViewStyle {
    func opacity() -> CGFloat {
        switch self {
        case .primary:
            return 1
        case .secondary:
            return 0.5
        }
    }
}
