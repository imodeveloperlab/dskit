//
//  Appearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSKitAppearance: DSAppearance {
    
    // Appearance title
    public var title: String
    
    public var darkModeSupport: Bool = true
    
    // Brand color
    public var brandColor: UIColor
    
    // Primary view colors
    public var primaryView: DSDesignableViewColors
    
    // Secondary view colors
    public var secondaryView: DSDesignableViewColors
    
    /// Margins and spaces
    public var size: DSDesignableSize = DSDefaultDesignableSize(spatialSystem: 7)
    
    // Tabbar
    public var tabBar: DSDesignableTabbarColor
    
    // Navigation bar
    public var navigationBar: DSDesignableNavigationBarColor
    
    // Text field
    public var textField: DSDesignableTextFieldColor
    
    // Price
    public var price: DSDesignablePriceColor
    
    // Fonts
    public var fonts = DSDesignableFonts()
    
    // Large titles
    public var prefersLargeTitles: Bool = true
    
    // Button style
    public var buttonStyle: DSButtonStyle = .default
    
    // Action element height
    public var actionElementHeight: CGFloat = 48
    
    // Status bar
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .lightContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init DSKit appearance with specific brand color
    /// - Parameter brandColor: UIColor
    public init(brandColor: UIColor? = nil) {
        
        self.title = "DSKit"
        self.brandColor = brandColor ?? DSDynamicColor.color(light: 0x1DA1F2, dark: 0x1DA1F2)
        
        // MARK: - Primary view
        
        // Text
        let text = DSDesignableTextColor(largeTitle: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                         title1: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                         title2: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                         title3: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                         headline: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                         subheadline: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         body: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                         callout: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         caption1: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         caption2: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         footnote: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6))
        
        // Text field
        let primaryViewTextField = DSDesignableTextFieldColor(border: DSDynamicColor.color(light: 0xf3f4f2, dark: 0x101a24),
                                                              background: DSDynamicColor.color(light: 0xf3f4f2, dark: 0x101a24),
                                                              text: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                              placeHolder: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6))
        
        // Button
        let button = DSDesignableButtonColor(background: DSDynamicColor.color(light: 0x1da1f2, dark: 0x1da1f2),
                                             title: DSDynamicColor.color(light: 0xfefffe, dark: 0xfefffe))
        
        // Background
        let background = DSDynamicColor.color(light: 0xfefffe, dark: 0x15202b)
        
        // Separator
        let separator = DSDynamicColor.color(light: 0xd0dbe3, dark: 0x38444d)
        
        // Corner radius
        let cornerRadius: CGFloat = 10
        
        // View
        primaryView = DSDesignableViewColors(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: background,
                                             separator: separator,
                                             cornerRadius: cornerRadius)
        
        // MARK: - Secondary view
        
        // Text
        let secondaryText = DSDesignableTextColor(largeTitle: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  title1: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  title2: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  title3: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  headline: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  subheadline: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  body: DSDynamicColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  callout: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  caption1: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  caption2: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  footnote: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6))
        
        // Text field
        let secondaryViewTextField = DSDesignableTextFieldColor(border: DSDynamicColor.color(light: 0xfefffe, dark: 0x15202b),
                                                                background: DSDynamicColor.color(light: 0xfefffe, dark: 0x15202b),
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        
        // Button
        let sButton = DSDesignableButtonColor(background: DSDynamicColor.color(light: 0x5b7083, dark: 0x8899a6),
                                              title: DSDynamicColor.color(light: 0xfefffe, dark: 0xfefffe))
        
        // Background
        let sBackground = DSDynamicColor.color(light: 0xf3f4f2, dark: 0x101a24)
        
        // Separator
        let sSeparator = DSDynamicColor.color(light: 0xd0dbe3, dark: 0x38444d)
        
        // Corner radius
        let sCornerRadius: CGFloat = 10
        
        // View
        secondaryView = DSDesignableViewColors(button: sButton,
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: sBackground,
                                               separator: sSeparator,
                                               cornerRadius: sCornerRadius)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: primaryView.background,
                                         itemTint: primaryView.button.background,
                                         unselectedItemTint: text.subheadline,
                                         badge: self.brandColor,
                                         translucent: false)
        
        // MARK: - Navigation bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: primaryView.button.background,
                                                       text: text.title1,
                                                       bar: primaryView.background,
                                                       translucent: false)
        
        // MARK: - Textfield
        
        textField = DSDesignableTextFieldColor(border: primaryView.separator,
                                               background: secondaryView.background,
                                               text: secondaryView.text.title1,
                                               placeHolder: secondaryView.text.subheadline)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(currency: text.headline,
                                       amount: text.headline,
                                       regularAmount: text.subheadline,
                                       badgeBackground: UIColor(0xFF656B))
    }
}
