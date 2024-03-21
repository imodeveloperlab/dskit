//
//  AppearanceEnvironment.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 27.12.2022.
//

import SwiftUI

struct AppearanceEnvironment: EnvironmentKey {
    static let defaultValue: DSAppearance = DSKitAppearance()
}

public extension EnvironmentValues {
    var appearance: DSAppearance {
        get { self[AppearanceEnvironment.self] }
        set { self[AppearanceEnvironment.self] = newValue }
    }
}

struct AppearanceColorGroupEnvironment: EnvironmentKey {
    static let defaultValue: DSColorGroup = .primary
}

public extension EnvironmentValues {
    var colorGroup: DSColorGroup {
        get { self[AppearanceColorGroupEnvironment.self] }
        set { self[AppearanceColorGroupEnvironment.self] = newValue }
    }
}

struct LayoutEnvironment: EnvironmentKey {
    static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var debugLayout: Bool {
        get { self[LayoutEnvironment.self] }
        set { self[LayoutEnvironment.self] = newValue }
    }
}

public enum DSColorGroup {
    case primary
    case secondary
}

public extension DSColorGroup {
    func colors(from appearance: DSAppearance) -> DSDesignableViewColors {
        switch self {
        case .primary:
            return appearance.primaryView
        case .secondary:
            return appearance.secondaryView
        }
    }
}


extension DSColorGroup {
    func opacity() -> CGFloat {
        switch self {
        case .primary:
            return 1
        case .secondary:
            return 0.5
        }
    }
}

import UIKit

extension UIColor {
    /// Lightens the color by the specified percentage.
    /// - Parameter percentage: The percentage by which to lighten the color (0 to 1).
    /// - Returns: A lighter UIColor.
    func lighter(by percentage: CGFloat) -> UIColor {
        return adjustBrightness(by: abs(percentage))
    }

    /// Darkens the color by the specified percentage.
    /// - Parameter percentage: The percentage by which to darken the color (0 to 1).
    /// - Returns: A darker UIColor.
    func darker(by percentage: CGFloat) -> UIColor {
        return adjustBrightness(by: -abs(percentage))
    }

    /// Adjusts the brightness of the color.
    /// - Parameter percentage: The percentage by which to adjust the brightness. Positive to lighten, negative to darken.
    /// - Returns: An adjusted UIColor.
    private func adjustBrightness(by percentage: CGFloat) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            brightness += percentage * brightness
            brightness = min(max(brightness, 0), 1) // Ensure within [0, 1] range
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        }

        return self
    }
}
