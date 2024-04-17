//
//  DarkLightAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class DarkLightAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 6.5)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 6.5)
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var textField: DSTextFieldAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 48
    public var screenMargins: CGFloat = 16
    
    /// Init DSKit appearance with specific brand color
    /// - Parameter brandColor: UIColor
    public init(brandColor: UIColor? = nil) {
        
        self.title = "Dark / Light"
        
        // MARK: - Primary view
        
        // Text
        let text = DSTextAppearance(
            largeTitle: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            title1: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            title2: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            title3: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            headline: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            subheadline: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            body: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            callout: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            caption1: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            caption2: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            footnote: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6)
        )
        
        // Text field
        let primaryViewTextField = DSTextFieldAppearance(
            border: DSDynamicColor.color(light: 0xf3f4f2, dark: 0x101a24),
            background: DSDynamicColor.color(light: 0xf3f4f2, dark: 0x101a24),
            text: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            placeHolder: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6)
        )
        
        // Button
        let button = DSButtonAppearance(
            accentColor: DSDynamicColor.color(light: 0x1da1f2, dark: 0x1da1f2),
            supportColor: DSDynamicColor.color(light: 0xfefffe, dark: 0xfefffe)
        )
        
        // Background
        let background = DSDynamicColor.color(light: 0xfefffe, dark: 0x15202b)
        
        // Separator
        let separator = DSDynamicColor.color(light: 0xd0dbe3, dark: 0x38444d)
        
        // Corner radius
        let cornerRadius: CGFloat = 10
        
        // View
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: background,
            separator: separator,
            cornerRadius: cornerRadius
        )
        
        // MARK: - Secondary view
        
        // Text
        let secondaryText = DSTextAppearance(
            largeTitle: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            title1: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            title2: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            title3: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            headline: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            subheadline: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            body: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
            callout: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            caption1: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            caption2: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            footnote: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6)
        )
        
        // Text field
        let secondaryViewTextField = DSTextFieldAppearance(
            border: DSDynamicColor.color(light: 0xfefffe, dark: 0x15202b),
            background: DSDynamicColor.color(light: 0xfefffe, dark: 0x15202b),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        // Button
        let sButton = DSButtonAppearance(
            accentColor: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
            supportColor: DSDynamicColor.color(light: 0xfefffe, dark: 0xfefffe)
        )
        
        // Background
        let sBackground = DSDynamicColor.color(light: 0xf3f4f2, dark: 0x101a24)
        
        // Separator
        let sSeparator = DSDynamicColor.color(light: 0xd0dbe3, dark: 0x38444d)
        
        // Corner radius
        let sCornerRadius: CGFloat = 10
        
        // View
        secondaryView = DSViewAppearance(
            button: sButton,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: sBackground,
            separator: sSeparator,
            cornerRadius: sCornerRadius
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.accentColor,
            unselectedItemTint: text.subheadline,
            badge: primaryView.button.accentColor,
            translucent: false
        )
        
        // MARK: - Navigation bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: primaryView.button.accentColor,
            text: text.title1,
            bar: primaryView.background,
            translucent: false
        )
        
        // MARK: - Textfield
        
        textField = DSTextFieldAppearance(
            border: primaryView.separator,
            background: secondaryView.background,
            text: secondaryView.text.title1,
            placeHolder: secondaryView.text.subheadline
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            currency: text.headline,
            amount: text.headline,
            regularAmount: text.subheadline,
            badgeBackground: UIColor(0xFF656B)
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
