//
//  ShopAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class ShopAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 7)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 7)
    public var dimension: DSDimensionProtocol = DSDimensionSystem(spatialSystem: 7)
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 48
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Shop") {
        
        self.title = title
        
        // MARK: - Primary view
        
        let text = DSTextAppearance.textColors(
            main: UIColor(0x484848),
            secondary: UIColor(0x767676)
        )
        
        let button = DSButtonAppearance(
            background: UIColor(0x006EB9),
            title: UIColor(0xffffff)
        )
        
        let primaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xF4F4F4),
            background: UIColor(0xF4F4F4),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: UIColor(0xFFFFFF),
            separator: UIColor(0xD5C5B2),
            cornerRadius: 10
        )
        
        // MARK: - Secondary view
        
        let secondaryText = DSTextAppearance.textColors(
            main: UIColor(0x222222),
            secondary: UIColor(0x717171)
        )
        
        let secondaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xFFFFFF),
            background: UIColor(0xFFFFFF),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        secondaryView = DSViewAppearance(
            button: button,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: UIColor(0xF4F4F4),
            separator: UIColor(0xEBEBEB),
            cornerRadius: 10
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.background,
            unselectedItemTint: secondaryText.subheadline,
            badge: primaryView.button.background,
            translucent: true
        )
        
        // MARK: - Navigation Bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: UIColor(0x3C4856),
            text: text.title1,
            bar: primaryView.background,
            translucent: true
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            currency: UIColor(0x1DA1F2),
            amount: UIColor(0x1DA1F2),
            regularAmount: UIColor(0xA0ACBD),
            badgeBackground: UIColor(0x3C4856),
            badgeCornerRadius: 6
        )
    }
    
    public func style(for viewStyle: DSViewStyle) -> DSViewAppearanceProtocol {
        return switch viewStyle {
        case .primary:
            primaryView
        case .secondary:
            secondaryView
        }
    }
}
