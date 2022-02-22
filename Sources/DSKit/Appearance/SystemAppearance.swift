//
//  SystemAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// System appearance, uses iOS system colors
public class SystemAppearance: DSDesignable {
    
    // Appearance title
    public var title: String
    
    // Brand color
    public var brandColor: UIColor
    
    // Primary view colors
    public var primaryView: DSDesignableViewColors
    
    // Secondary view colors
    public var secondaryView: DSDesignableViewColors
    
    // General view margins
    public var margins: CGFloat = 15
    
    // Margins for grouped content
    public var groupMargins: CGFloat = 10
    
    // Inter items spacing
    public var interItemSpacing: CGFloat = 7
    
    // Tab bar colors
    public var tabBar: DSDesignableTabbarColor
    
    // Navigation bar colors
    public var navigationBar: DSDesignableNavigationBarColor
    
    // Currency colors
    public var price: DSDesignablePriceColor
    
    // Fonts
    public var fonts = DSDesignableFonts()
    
    // Prefer large titles
    public var prefersLargeTitles: Bool = true
    
    // Default buttons heights
    public var buttonsHeight: CGFloat = 45
    
    // Status bar styles
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .lightContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "System") {
        
        self.title = title
        self.brandColor = brandColor ?? DSColor.color(light: 0x1DA1F2, dark: 0x1DA1F2)
        
        let background = UIColor.systemBackground
        let secondaryBackground = UIColor.secondarySystemBackground
        
        // MARK: - Primary View
        
        let button = DSDesignableButtonColor(background: self.brandColor,
                                             title: DSColor.color(light: 0xFEFFFE, dark: 0xFEFFFE))
        
        let text = DSDesignableTextColor(largeTitle: UIColor.label,
                                         title1: UIColor.label,
                                         title2: UIColor.label,
                                         title3: UIColor.label,
                                         headline: UIColor.label,
                                         subheadline: UIColor.secondaryLabel,
                                         body: UIColor.label,
                                         callout: UIColor.secondaryLabel,
                                         caption1: UIColor.secondaryLabel,
                                         caption2: UIColor.tertiaryLabel,
                                         footnote: UIColor.quaternaryLabel)
        
        let secondaryText = DSDesignableTextColor(largeTitle: UIColor.label,
                                                  title1: UIColor.label,
                                                  title2: UIColor.label,
                                                  title3: UIColor.label,
                                                  headline: UIColor.label,
                                                  subheadline: UIColor.secondaryLabel,
                                                  body: UIColor.label,
                                                  callout: UIColor.secondaryLabel,
                                                  caption1: UIColor.secondaryLabel,
                                                  caption2: UIColor.tertiaryLabel,
                                                  footnote: UIColor.quaternaryLabel)
        let separator = UIColor.separator
        
        let primaryViewTextField = DSDesignableTextFieldColor(border: secondaryBackground,
                                                              background: secondaryBackground,
                                                              text: secondaryText.headline,
                                                              placeHolder: secondaryText.subheadline)
        
        primaryView = DSDesignableViewColors(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: background,
                                             separator: separator,
                                             cornerRadius: 5)
        
        // MARK: - Secondary view
        
        let secondaryViewTextField = DSDesignableTextFieldColor(border: background,
                                                                background: background,
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        
        secondaryView = DSDesignableViewColors(button: button,
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: secondaryBackground,
                                               separator: separator,
                                               cornerRadius: 5)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: background,
                                         itemTint: button.background,
                                         unselectedItemTint: text.subheadline,
                                         badge: self.brandColor)
        
        // MARK: - Navigation Bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: button.background,
                                                       text: text.title1,
                                                       bar: background)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(currency: self.brandColor,
                                       amount: self.brandColor,
                                       regularAmount: text.subheadline)
    }
}
