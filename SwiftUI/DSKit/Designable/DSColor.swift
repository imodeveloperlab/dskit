//
//  DSViewType.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.12.2022.
//

import UIKit
import SwiftUI

public enum DSColor: Equatable, Hashable {
    
    case brandColor
    case style(DSViewStyle, DSViewColor)
    case view(DSViewColor)
    case primary(DSViewColor)
    case secondary(DSViewColor)
    case text(DSTextFont)
    case navigationBarButton
    case navigationBarText
    case navigationBarBackground
    case tabBarBarTint
    case tabBarItemTint
    case tabBarUnselectedItemTint
    case tabBarBadge
    case priceCurrency
    case priceAmount
    case priceRegularAmount
    case priceBadgeBackground
    case priceBadgeText
    case customColor(Color)
    
    func styledColorDemo(from appearance: DSAppearance, and style: DSViewStyle) -> UIColor {
        switch self {
        case .brandColor:
            return appearance.brandColor
        case .style(let style, let viewColor):
            return appearance.style(for: style).color(for: viewColor, appearance: appearance, style: style)
        case .primary(let viewColor):
            return appearance.style(for: .primary).color(for: viewColor, appearance: appearance, style: style)
        case .secondary(let viewColor):
            return appearance.style(for: .secondary).color(for: viewColor, appearance: appearance, style: style)
        case .navigationBarButton:
            return appearance.navigationBar.buttons
        case .navigationBarText:
            return appearance.navigationBar.text
        case .navigationBarBackground:
            return appearance.navigationBar.bar
        case .tabBarBarTint:
            return appearance.tabBar.barTint
        case .tabBarItemTint:
            return appearance.tabBar.itemTint
        case .tabBarUnselectedItemTint:
            return appearance.tabBar.unselectedItemTint
        case .tabBarBadge:
            return appearance.tabBar.badge
        case .priceCurrency:
            return appearance.price.currency
        case .priceAmount:
            return appearance.price.amount
        case .priceRegularAmount:
            return appearance.price.regularAmount
        case .priceBadgeBackground:
            return appearance.price.badgeBackground
        case .priceBadgeText:
            return appearance.price.badgeText
        case .customColor(let color):
            return UIColor(color)
        case .text(let font):
            return appearance.style(for: style).color(for: .text(.font(font)), appearance: appearance, style: style)
        case .view(let color):
            return appearance.style(for: style).color(for: color, appearance: appearance, style: style)
        }
    }
}

