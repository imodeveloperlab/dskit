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
    public var darkModeSupport: Bool = true
    public var brandColor: UIColor
    public var primaryView: DSDesignableViewColors
    public var secondaryView: DSDesignableViewColors
    public var spacing: DSDesignableSpacing = DSDefaultDesignableSpacing(spatialSystem: 7)
    public var padding: DSDesignablePadding = DSDefaultDesignablePadding(spatialSystem: 7)
    public var dimension: DSDesignableDimension = DSDefaultDesignableDimension(spatialSystem: 7)
    public var margins: CGFloat = 15
    public var groupMargins: CGFloat = 10
    public var interItemSpacing: CGFloat = 7
    public var tabBar: DSDesignableTabbarColor
    public var navigationBar: DSDesignableNavigationBarColor
    public var price: DSDesignablePriceColor
    public var fonts = DSDesignableFonts()
    public var prefersLargeTitles: Bool = true
    public var actionElementHeight: CGFloat = 45
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .lightContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Retro") {
        
        self.title = title
        self.brandColor = brandColor ?? DSDynamicColor.color(light: 0xFF8F00, dark: 0xFF8F00)
        
        // MARK: - Secondary view
        
        let text = DSDesignableTextColor(largeTitle: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
                                         title1: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
                                         title2: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
                                         title3: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
                                         headline: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
                                         subheadline: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
                                         body: DSDynamicColor.color(light: 0x2B2834, dark: 0xE8E7E6),
                                         callout: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
                                         caption1: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
                                         caption2: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8),
                                         footnote: DSDynamicColor.color(light: 0x4E4A57, dark: 0x9699A8))
        
        let primaryViewTextField = DSDesignableTextFieldColor(border: DSDynamicColor.color(light: 0xF4F2EA, dark: 0x4E4A57),
                                                              background: DSDynamicColor.color(light: 0xF4F2EA, dark: 0x4E4A57),
                                                              text: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
                                                              placeHolder: DSDynamicColor.color(light: 0x777777, dark: 0x9699A8))
        
        primaryView = DSDesignableViewColors(button: DSDesignableButtonColor(background: DSDynamicColor.color(light: 0xFC8F0F, dark: 0xFC8F0F),
                                                                             title: DSDynamicColor.color(light: 0xffffff, dark: 0xffffff)),
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: DSDynamicColor.color(light: 0xFFFCF8, dark: 0x383443),
                                             separator: DSDynamicColor.color(light: 0xFBEFE0, dark: 0x464154),
                                             cornerRadius: 13)
        
        // MARK: - Secondary view
        
        let secondaryText = DSDesignableTextColor(largeTitle: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
                                                  title1: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
                                                  title2: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
                                                  title3: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
                                                  headline: DSDynamicColor.color(light: 0x000000, dark: 0xE8E7E6),
                                                  subheadline: DSDynamicColor.color(light: 0x555555, dark: 0x999DB1),
                                                  body: DSDynamicColor.color(light: 0x2A2732, dark: 0xE8E7E6),
                                                  callout: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1),
                                                  caption1: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1),
                                                  caption2: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1),
                                                  footnote: DSDynamicColor.color(light: 0x595465, dark: 0x999DB1))
        
        let secondaryViewTextField = DSDesignableTextFieldColor(border: DSDynamicColor.color(light: 0xffffff, dark: 0x383443),
                                                                background: DSDynamicColor.color(light: 0xffffff, dark: 0x383443),
                                                                text: secondaryText.headline,
                                                                placeHolder: secondaryText.subheadline)
        
        secondaryView = DSDesignableViewColors(button: DSDesignableButtonColor(background: DSDynamicColor.color(light: 0xFC8F0F, dark: 0xFC8F0F),
                                                                               title: DSDynamicColor.color(light: 0xffffff, dark: 0xffffff)),
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: DSDynamicColor.color(light: 0xF4F2EA, dark: 0x4E4A57),
                                               separator: DSDynamicColor.color(light: 0xDFDCD3, dark: 0xFFFCF8),
                                               cornerRadius: 13)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: primaryView.background,
                                         itemTint: primaryView.button.background,
                                         unselectedItemTint: text.subheadline,
                                         badge: self.brandColor)
        
        // MARK: - Navigation Bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: primaryView.button.background,
                                                       text: text.title1,
                                                       bar: primaryView.background)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(
            currency: self.brandColor,
            amount: self.brandColor,
            regularAmount: text.subheadline,
            badgeBackground: self.brandColor
        )
    }
}
