//
//  PeachAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

import UIKit

public class PeachAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 7)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 7)
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 48
    public var screenMargins: CGFloat = 16
    
    public init(brandColor: UIColor? = nil, title: String = "Peach") {
        
        self.title = title
        
        // MARK: - Primary view
        let text = DSTextAppearance.textColors(
            main: .dynamic(light: 0x484848, dark: 0xFFFFFF),
            secondary: .dynamic(light: 0x767676, dark: 0xD0D0D0)
        )
        
        let button = DSButtonAppearance(
            accentColor: .dynamic(light: 0xFF5A5F, dark: 0xFF5A5F),
            supportColor: .dynamic(light: 0xFFFFFF, dark: 0xFFFFFF)
        )
        
        let primaryViewTextField = DSTextFieldAppearance(
            background: .dynamic(light: 0xF4F4F4, dark: 0x2D2D2D),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: .dynamic(light: 0xFFFFFF, dark: 0x1A1A1A),
            separator: .dynamic(light: 0xD5C5B2, dark: 0x70635A),
            cornerRadius: 12
        )
        
        // MARK: - Secondary view
        
        let secondaryText = DSTextAppearance.textColors(
            main: .dynamic(light: 0x222222, dark: 0xDDDDDD),
            secondary: .dynamic(light: 0x717171, dark: 0x999999)
        )
        
        let secondaryViewTextField = DSTextFieldAppearance(
            background: .dynamic(light: 0xFFFFFF, dark: 0x1A1A1A),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        let secondaryViewButton = DSButtonAppearance(
            accentColor: .dynamic(light: 0xFF5A5F, dark: 0xFF5A5F),
            supportColor: .dynamic(light: 0xFFFFFF, dark: 0xFFFFFF)
        )
        
        secondaryView = DSViewAppearance(
            button: secondaryViewButton,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: .dynamic(light: 0xF4F4F4, dark: 0x2D2D2D),
            separator: .dynamic(light: 0xEBEBEB, dark: 0x555555),
            cornerRadius: 12
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: .dynamic(light: 0xFFFFFF, dark: 0x1A1A1A),
            itemTint: .dynamic(light: 0xFF5A5F, dark: 0xFF5A5F),
            unselectedItemTint: .dynamic(light: 0x717171, dark: 0x999999),
            badge: .dynamic(light: 0xFF5A5F, dark: 0xFF5A5F),
            translucent: true
        )
        
        // MARK: - Navigation Bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: .dynamic(light: 0xFF5A5F, dark: 0xD0D0D0),
            text: text.title1,
            bar: .dynamic(light: 0xFFFFFF, dark: 0x1A1A1A),
            translucent: true
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            regularAmount: .dynamic(light: 0x4A1F0F, dark: 0x8C8C8C),
            badgeBackground: .dynamic(light: 0xFF5A5F, dark: 0xFF5A5F),
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

