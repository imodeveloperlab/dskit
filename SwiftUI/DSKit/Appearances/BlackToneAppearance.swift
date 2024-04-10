//
//  DarkAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class BlackToneAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 6)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 6)
    public var dimension: DSDimensionProtocol = DSDimensionSystem(spatialSystem: 6)
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 44
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Black") {
        
        self.title = title
        
        // MARK: - Primary view
        
        // Text colors
        let text = DSTextAppearance.textColors(
            main: UIColor(0x484848), secondary: UIColor(0x767676)
        )
        
        let button = DSButtonAppearance(
            background: UIColor(0x222222), title: UIColor(0xffffff)
        )
        
        // Text field
        let primaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xF4F4F4),
            background: UIColor(0xF4F4F4),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        // View
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: UIColor(0xFFFFFF),
            separator: UIColor(0xD5C5B2),
            cornerRadius: 2
        )
        
        // MARK: - Secondary view
        
        // Text
        let secondaryText = DSTextAppearance.textColors(
            main: UIColor(0x222222), secondary: UIColor(0x717171)
        )
        
        // Text field
        let secondaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xFFFFFF),
            background: UIColor(0xFFFFFF),
            text: text.headline,
            placeHolder: text.subheadline
        )
        // View
        secondaryView = DSViewAppearance(
            button: button,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: UIColor(0xF4F4F4),
            separator: UIColor(0xEBEBEB),
            cornerRadius: 2
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.background,
            unselectedItemTint: secondaryText.subheadline,
            badge: UIColor.red,
            translucent: true
        )
        
        // MARK: - Navigation bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: UIColor(0x666666),
            text: text.title1,
            bar: primaryView.background,
            translucent: true
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            currency: UIColor(0x000000),
            amount: UIColor(0x000000),
            regularAmount: UIColor(0x666666),
            badgeBackground: UIColor(0xFBB666),
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
