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
    case primaryViewButtonBackground
    case primaryViewButtonTitle
    case primaryViewBackground
    case primaryViewSeparator
    case primaryViewTextFieldBorder
    case primaryViewTextFieldBackground
    case primaryViewTextFieldText
    case primaryViewTextFieldPlaceholder
    case primaryViewText(DSTextColor)
    case secondaryViewButtonBackground
    case secondaryViewButtonTitle
    case secondaryViewBackground
    case secondaryViewSeparator
    case secondaryViewTextFieldBorder
    case secondaryViewTextFieldBackground
    case secondaryViewTextFieldText
    case secondaryViewTextFieldPlaceholder
    case secondaryViewText(DSTextColor)
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
        case .primaryViewButtonBackground:
            return appearance.primaryView.button.background
        case .primaryViewButtonTitle:
            return appearance.primaryView.button.title
        case .primaryViewBackground:
            return appearance.primaryView.background
        case .primaryViewSeparator:
            return appearance.primaryView.separator
        case .primaryViewTextFieldBorder:
            return appearance.primaryView.textField.border
        case .primaryViewTextFieldBackground:
            return appearance.primaryView.textField.background
        case .primaryViewTextFieldText:
            return appearance.primaryView.textField.text
        case .primaryViewTextFieldPlaceholder:
            return appearance.primaryView.textField.placeHolder
        case .primaryViewText(let type):
            return type.getColor(appearance: appearance, colorGroup: .primary)
        case .secondaryViewButtonBackground:
            return appearance.secondaryView.button.background
        case .secondaryViewButtonTitle:
            return appearance.secondaryView.button.title
        case .secondaryViewBackground:
            return appearance.secondaryView.background
        case .secondaryViewSeparator:
            return appearance.secondaryView.separator
        case .secondaryViewTextFieldBorder:
            return appearance.secondaryView.textField.border
        case .secondaryViewTextFieldBackground:
            return appearance.secondaryView.textField.background
        case .secondaryViewTextFieldText:
            return appearance.secondaryView.textField.text
        case .secondaryViewTextFieldPlaceholder:
            return appearance.secondaryView.textField.placeHolder
        case .secondaryViewText(let type):
            return type.getColor(appearance: appearance, colorGroup: .secondary)
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

