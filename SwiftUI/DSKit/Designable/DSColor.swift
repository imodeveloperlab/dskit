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
    case viewColor(DSViewColor, DSViewStyle)
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
    case custom(UIColor)
    case customColor(Color)
    
    func color(from appearance: DSAppearance) -> UIColor {
        switch self {
        case .brandColor:
            return appearance.brandColor
        case .viewColor(let viewColor, let style):
            return appearance.style(for: style).color(for: viewColor)
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
        case .custom(let color):
            return color
        case .customColor(let color):
            return UIColor(color)
        }
    }
}

