//
//  Appearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class DSKitAppearance: DSDesignable {
    
    // Appearance title
    public var title: String
    
    // Brand color
    public var brandColor: UIColor
    
    // Primary view colors
    public var primaryView: DSDesignableViewColors
    
    // Secondary view colors
    public var secondaryView: DSDesignableViewColors
    
    // Margins
    public var margins: CGFloat = 20
    
    // Group margins
    public var groupMargins: CGFloat = 10

    // Interitem spacing
    public var interItemSpacing: CGFloat = 10
    
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
    public var buttonStyle: ImoUIButtonStyle = .default
    
    // Buttons height
    public var buttonsHeight: CGFloat = 48
    
    // Status bar
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .lightContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init DSKit appearance with specific brand color
    /// - Parameter brandColor: UIColor
    public init(brandColor: UIColor? = nil) {
        
        self.title = "DSKit"
        self.brandColor = brandColor ?? DSColor.color(light: 0x1DA1F2, dark: 0x1DA1F2)
        
        // MARK: - Primary view
        
        // Text
        let text = DSDesignableTextColor(largeTitle: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                         title1: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                         title2: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                         title3: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                         headline: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                         subheadline: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         body: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                         callout: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         caption1: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         caption2: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                         footnote: DSColor.color(light: 0x5b7083, dark: 0x8899a6))
        
        // Text field
        let primaryViewTextField = DSDesignableTextFieldColor(border: DSColor.color(light: 0xf3f4f2, dark: 0x101a24),
                                                              background: DSColor.color(light: 0xf3f4f2, dark: 0x101a24),
                                                              text: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                              placeHolder: DSColor.color(light: 0x5b7083, dark: 0x8899a6))
        
        // Button
        let button = DSDesignableButtonColor(background: DSColor.color(light: 0x1da1f2, dark: 0x1da1f2),
                                             title: DSColor.color(light: 0xfefffe, dark: 0xfefffe))
        
        // Background
        let background = DSColor.color(light: 0xfefffe, dark: 0x15202b)
        
        // Separator
        let separator = DSColor.color(light: 0xd0dbe3, dark: 0x38444d)
        
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
        let secondaryText = DSDesignableTextColor(largeTitle: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  title1: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  title2: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  title3: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  headline: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  subheadline: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  body: DSColor.color(light: 0x14171a, dark: 0xfefffe),
                                                  callout: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  caption1: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  caption2: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                                  footnote: DSColor.color(light: 0x5b7083, dark: 0x8899a6))
        
        // Text field
        let secondaryViewTextField = DSDesignableTextFieldColor(border: DSColor.color(light: 0xfefffe, dark: 0x15202b),
                                                                background: DSColor.color(light: 0xfefffe, dark: 0x15202b),
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        
        // Button
        let sButton = DSDesignableButtonColor(background: DSColor.color(light: 0x5b7083, dark: 0x8899a6),
                                              title: DSColor.color(light: 0xfefffe, dark: 0xfefffe))
        
        // Background
        let sBackground = DSColor.color(light: 0xf3f4f2, dark: 0x101a24)
        
        // Separator
        let sSeparator = DSColor.color(light: 0xd0dbe3, dark: 0x38444d)
        
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
