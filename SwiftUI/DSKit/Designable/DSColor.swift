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
    case viewStyleAndColor(DSViewStyle, DSViewColor)
    case viewColor(DSViewColor)
    case primaryView(DSViewColor)
    case secondaryView(DSViewColor)
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
    case color(Color)
    
    func color(for appearance: DSAppearance, and style: DSViewStyle) -> Color {
        switch self {
        case .brandColor:
            return appearance.brandColor.color
        case .viewStyleAndColor(let style, let viewColor):
            return appearance.style(for: style).color(for: viewColor, appearance: appearance, style: style)
        case .primaryView(let viewColor):
            return appearance.style(for: .primary).color(for: viewColor, appearance: appearance, style: style)
        case .secondaryView(let viewColor):
            return appearance.style(for: .secondary).color(for: viewColor, appearance: appearance, style: style)
        case .navigationBarButton:
            return appearance.navigationBar.buttons.color
        case .navigationBarText:
            return appearance.navigationBar.text.color
        case .navigationBarBackground:
            return appearance.navigationBar.bar.color
        case .tabBarBarTint:
            return appearance.tabBar.barTint.color
        case .tabBarItemTint:
            return appearance.tabBar.itemTint.color
        case .tabBarUnselectedItemTint:
            return appearance.tabBar.unselectedItemTint.color
        case .tabBarBadge:
            return appearance.tabBar.badge.color
        case .priceCurrency:
            return appearance.price.currency.color
        case .priceAmount:
            return appearance.price.amount.color
        case .priceRegularAmount:
            return appearance.price.regularAmount.color
        case .priceBadgeBackground:
            return appearance.price.badgeBackground.color
        case .priceBadgeText:
            return appearance.price.badgeText.color
        case .color(let color):
            return color
        case .text(let font):
            return appearance.style(for: style).color(for: .text(.font(font)), appearance: appearance, style: style)
        case .viewColor(let color):
            return appearance.style(for: style).color(for: color, appearance: appearance, style: style)
        }
    }
}

