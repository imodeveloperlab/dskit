//
//  DSViewType.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.12.2022.
//

import UIKit
import SwiftUI

public enum DSColorKey: Equatable, Hashable {
    
    case viewStyleAndColor(DSViewStyle, DSViewColorKey)
    case viewColor(DSViewColorKey)
    case primaryView(DSViewColorKey)
    case secondaryView(DSViewColorKey)
    case text(DSTextFontKey)
    case navBar(DSNavigationBarColor)
    case tabBar(DSTabBarColorKey)
    case price(DSPriceColorKey)
    case color(Color)
    
    func color(for appearance: DSAppearance, and style: DSViewStyle) -> Color {
        switch self {
        case .viewStyleAndColor(let style, let viewColor):
            return appearance.style(for: style).color(for: viewColor, appearance: appearance, style: style)
        case .primaryView(let viewColor):
            return appearance.style(for: .primary).color(for: viewColor, appearance: appearance, style: style)
        case .secondaryView(let viewColor):
            return appearance.style(for: .secondary).color(for: viewColor, appearance: appearance, style: style)
        case .navBar(let key):
            return appearance.navigationBar.color(key: key)
        case .tabBar(let key):
            return appearance.tabBar.color(key: key)
        case .price(let key):
            return appearance.price.color(key: key)
        case .color(let color):
            return color
        case .text(let font):
            return appearance.style(for: style).color(for: .text(.font(font)), appearance: appearance, style: style)
        case .viewColor(let color):
            return appearance.style(for: style).color(for: color, appearance: appearance, style: style)
        }
    }
}

