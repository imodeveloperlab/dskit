//
//  BlueAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class BlueAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 7)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 7)
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 44
    public var screenMargins: CGFloat = 16
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Blue") {
        
        self.title = title
        
        // MARK: - Primary view
        
        let text = DSTextAppearance.textColors(
            main: .dynamic(light: 0x484848, dark: 0xE0E0E0),
            secondary: .dynamic(light: 0x767676, dark: 0xA0A0A0)
        )
        
        let button = DSButtonAppearance(
            accentColor: .dynamic(light: 0x006EB9, dark: 0x006EB8),
            supportColor: .dynamic(light: 0xffffff, dark: 0xffffff)
        )
        
        let primaryViewTextField = DSTextFieldAppearance(
            background: .dynamic(light: 0xF4F4F4, dark: 0x181825),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: .dynamic(light: 0xFFFFFF, dark: 0x1E1E2E),
            separator: .dynamic(light: 0xD5C5B2, dark: 0x364A5D),
            cornerRadius: 10
        )
        
        // MARK: - Secondary view
        
        let secondaryText = DSTextAppearance.textColors(
            main: .dynamic(light: 0x222222, dark: 0xDDDDDD),
            secondary: .dynamic(light: 0x717171, dark: 0x999999)
        )
        
        let secondaryViewTextField = DSTextFieldAppearance(
            background: .dynamic(light: 0xFFFFFF, dark: 0x1E1E2E),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        secondaryView = DSViewAppearance(
            button: button,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: .dynamic(light: 0xF4F4F4, dark: 0x181825),
            separator: .dynamic(light: 0xEBEBEB, dark: 0xEBEBEB),
            cornerRadius: 10
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.accentColor,
            unselectedItemTint: secondaryText.subheadline,
            badge: primaryView.button.accentColor,
            translucent: true
        )
        
        // MARK: - Navigation Bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: .dynamic(light: 0x3C4856, dark: 0x006EB9),
            text: text.title1,
            bar: primaryView.background,
            translucent: true
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            regularAmount: .dynamic(light: 0xA0ACBD, dark: 0xBCCADC),
            badgeBackground: .dynamic(light: 0x316CAF, dark: 0x4C5866),
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

