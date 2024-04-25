//
//  DarkAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class DarkAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 6)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 6)
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 44
    public var screenMargins: CGFloat = 16
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Dark") {
        
        self.title = title
        
        // MARK: - Primary view
        
        // Text colors
        let text = DSTextAppearance.textColors(
            main: .dynamic(light: 0x484848, dark: 0xE0E0E0),
            secondary: .dynamic(light: 0x767676, dark: 0xA0A0A0)
        )
        
        let button = DSButtonAppearance(
            accentColor: .dynamic(light: 0x222222, dark: 0xDDDDDD),
            supportColor: .dynamic(light: 0xffffff, dark: 0x333333)
        )
        
        // Text field
        let primaryViewTextField = DSTextFieldAppearance(
            background: .dynamic(light: 0xF4F4F4, dark: 0x333333),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        // View
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: .dynamic(light: 0xFFFFFF, dark: 0x202020),
            separator: .dynamic(light: 0xD5C5B2, dark: 0x8D7A66),
            cornerRadius: 2
        )
        
        // MARK: - Secondary view
        
        // Text
        let secondaryText = DSTextAppearance.textColors(
            main: .dynamic(light: 0x222222, dark: 0xDDDDDD),
            secondary: .dynamic(light: 0x717171, dark: 0x999999)
        )
        
        // Text field
        let secondaryViewTextField = DSTextFieldAppearance(
            background: .dynamic(light: 0xFFFFFF, dark: 0x202020),
            text: text.headline,
            placeHolder: text.subheadline
        )
        // View
        secondaryView = DSViewAppearance(
            button: button,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: .dynamic(light: 0xF4F4F4, dark: 0x2D2D2D),
            separator: .dynamic(light: 0xEBEBEB, dark: 0x555555),
            cornerRadius: 2
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.accentColor,
            unselectedItemTint: secondaryText.subheadline,
            badge: UIColor.red,
            translucent: true
        )
        
        // MARK: - Navigation bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: .dynamic(light: 0x666666, dark: 0xAAAAAA),
            text: text.title1,
            bar: primaryView.background,
            translucent: true
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            regularAmount: .dynamic(light: 0x666666, dark: 0xBBBBBB),
            badgeBackground: .dynamic(light: 0xFBB666, dark: 0xDA9350),
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
