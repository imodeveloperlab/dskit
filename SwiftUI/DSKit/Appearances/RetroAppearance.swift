//
//  RetroAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public final class RetroAppearance: DSAppearance {
    
    public var title: String
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 7)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 7)
    public var dimension: DSDimensionProtocol = DSDimensionSystem(spatialSystem: 7)
    public var margins: CGFloat = 15
    public var groupMargins: CGFloat = 10
    public var interItemSpacing: CGFloat = 7
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 45
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Retro") {
        
        self.title = title
        
        // MARK: - Secondary view
        
        let text = DSTextAppearance(
            largeTitle: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
            title1: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
            title2: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
            title3: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
            headline: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
            subheadline: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
            body: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
            callout: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
            caption1: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
            caption2: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
            footnote: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8)
        )
        
        let primaryViewTextField = DSTextFieldAppearance(
            border: DSDynamicColor.color(light: 0xF4F2EA, dark: 0x4E4A57),
            background: DSDynamicColor.color(light: 0xF4F2EA, dark: 0x4E4A57),
            text: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
            placeHolder: DSDynamicColor.color(light: 0x777777, dark: 0x9699A8)
        )
        
        primaryView = DSViewAppearance(
            button: DSButtonAppearance(
                background: DSDynamicColor.color(light: 0xFC8F0F, dark: 0xFC8F0F),
                title: DSDynamicColor.color(light: 0xffffff, dark: 0xffffff)
            ),
            text: text,
            textField: primaryViewTextField,
            background: DSDynamicColor.color(light: 0xFFFCF8, dark: 0x383443),
            separator: DSDynamicColor.color(light: 0xFBEFE0, dark: 0x464154),
            cornerRadius: 13
        )
        
        // MARK: - Secondary view
        
        let secondaryText = DSTextAppearance(
            largeTitle: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
            title1: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
            title2: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
            title3: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
            headline: DSDynamicColor.color(light: 0x000000, dark: 0xE8E7E6),
            subheadline: DSDynamicColor.color(light: 0x555555, dark: 0x999DB1),
            body: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
            callout: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1),
            caption1: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1),
            caption2: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1),
            footnote: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1)
        )
        
        let secondaryViewTextField = DSTextFieldAppearance(
            border: DSDynamicColor.color(light: 0xffffff, dark: 0x383443),
            background: DSDynamicColor.color(light: 0xffffff, dark: 0x383443),
            text: secondaryText.headline,
            placeHolder: secondaryText.subheadline
        )
        
        secondaryView = DSViewAppearance(
            button: DSButtonAppearance(
                background: DSDynamicColor.color(light: 0xFC8F0F, dark: 0xFC8F0F),
                title: DSDynamicColor.color(light: 0xffffff, dark: 0xffffff)
            ),
            text: secondaryText,
            textField: secondaryViewTextField,
            background: DSDynamicColor.color(light: 0xF4F2EA, dark: 0x4E4A57),
            separator: DSDynamicColor.color(light: 0xDFDCD3, dark: 0xFFFCF8),
            cornerRadius: 13
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.background,
            unselectedItemTint: text.subheadline,
            badge: primaryView.button.background
        )
        
        // MARK: - Navigation Bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: primaryView.button.background,
            text: text.title1,
            bar: primaryView.background
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            currency: primaryView.button.background,
            amount: primaryView.button.background,
            regularAmount: text.subheadline,
            badgeBackground: primaryView.button.background
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
