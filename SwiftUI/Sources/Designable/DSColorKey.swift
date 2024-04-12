//
//  DSViewType.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.12.2022.
//

import UIKit
import SwiftUI

public enum DSColorKey: Equatable, Hashable {
    
    case viewStyle(DSViewStyle, DSViewColorKey)
    case view(DSViewColorKey)
    case text(DSTextFontKey)
    case navBar(DSNavigationBarColor)
    case tabBar(DSTabBarColorKey)
    case price(DSPriceColorKey)
    case color(Color)
    
    func color(for appearance: DSAppearance, and style: DSViewStyle) -> Color {
        switch self {
        case .viewStyle(let style, let viewKey):
            return appearance.style(for: style).color(for: viewKey, appearance: appearance, style: style)
        case .view(let viewKey):
            return appearance.style(for: style).color(for: viewKey, appearance: appearance, style: style)
        case .text(let textKey):
            return appearance.style(for: style).color(for: .text(.font(textKey)), appearance: appearance, style: style)
        case .navBar(let navBarKey):
            return appearance.navigationBar.color(key: navBarKey)
        case .tabBar(let tabBarKey):
            return appearance.tabBar.color(key: tabBarKey)
        case .price(let priceKey):
            return appearance.price.color(key: priceKey)
        case .color(let color):
            return color
        }
    }
}
