//
//  MintAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class MintAppearance: DSDesignable {
    
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
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .darkContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Mint") {
        
        self.title = title
        self.brandColor = brandColor ?? UIColor(0xFF5A5F)
        
        // MARK: - Primary view
        
        let text = DSDesignableTextColor.textColors(main: UIColor(0x484848), secondary: UIColor(0x767676))
        
        let button = DSDesignableButtonColor(background: UIColor(0x00A699), title: UIColor(0xffffff))
        
        let primaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xF4F4F4),
                                                              background: UIColor(0xF4F4F4),
                                                              text: text.headline,
                                                              placeHolder: text.subheadline)
        
        primaryView = DSDesignableViewColors(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: UIColor(0xFFFFFF),
                                             separator: UIColor(0xD5C5B2),
                                             cornerRadius: 8)
        
        // MARK: - Secondary view
        
        let secondaryText = DSDesignableTextColor.textColors(main: UIColor(0x222222), secondary: UIColor(0x717171))
        
        let secondaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xFFFFFF),
                                                                background: UIColor(0xFFFFFF),
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        
        secondaryView = DSDesignableViewColors(button: button,
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: UIColor(0xF4F4F4),
                                               separator: UIColor(0xEBEBEB),
                                               cornerRadius: 8)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: primaryView.background,
                                         itemTint: primaryView.button.background,
                                         unselectedItemTint: secondaryText.subheadline,
                                         badge: self.brandColor,
                                         translucent: true)
        
        // MARK: - Navigation bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: primaryView.button.background,
                                                       text: text.title1,
                                                       bar: primaryView.background,
                                                       translucent: true)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(currency: UIColor(0xFC642D),
                                       amount: UIColor(0xFC642D),
                                       regularAmount: UIColor(0x672912),
                                       badgeBackground: UIColor(0xFF5A5F))
    }
}
