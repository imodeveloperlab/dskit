//
//  DarkAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class BlackToneAppearance: DSAppearance {
   
    // Appearance title
    public var title: String
    
    public var darkModeSupport: Bool = false
    
    // Brand color
    public var brandColor: UIColor
    
    // Primary view colors
    public var primaryView: DSDesignableViewColors
    
    // Secondary view colors
    public var secondaryView: DSDesignableViewColors
    
    /// Margins and spaces
    public var size: DSDesignableSize = DSDefaultDesignableSize(spatialSystem: 6)
    
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
    
    // Default Action element heights
    public var actionElementHeight: CGFloat = 44
    
    // Status bar styles
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .darkContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Black") {
        
        self.title = title
        self.brandColor = brandColor ?? UIColor(0xFBB666)
        
        // MARK: - Primary view
        
        // Text colors
        let text = DSDesignableTextColor.textColors(main: UIColor(0x484848), secondary: UIColor(0x767676))
        let button = DSDesignableButtonColor(background: UIColor(0x222222), title: UIColor(0xffffff))
        
        // Text field
        let primaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xF4F4F4),
                                                              background: UIColor(0xF4F4F4),
                                                              text: text.headline,
                                                              placeHolder: text.subheadline)
        
        // View
        primaryView = DSDesignableViewColors(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: UIColor(0xFFFFFF),
                                             separator: UIColor(0xD5C5B2),
                                             cornerRadius: 2)
        
        // MARK: - Secondary view
        
        // Text
        let secondaryText = DSDesignableTextColor.textColors(main: UIColor(0x222222),
                                                             secondary: UIColor(0x717171))
        
        // Text field
        let secondaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xFFFFFF),
                                                                background: UIColor(0xFFFFFF),
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        // View
        secondaryView = DSDesignableViewColors(button: button,
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: UIColor(0xF4F4F4),
                                               separator: UIColor(0xEBEBEB),
                                               cornerRadius: 2)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: primaryView.background,
                                         itemTint: primaryView.button.background,
                                         unselectedItemTint: secondaryText.subheadline,
                                         badge: UIColor.red,
                                         translucent: true)
        
        // MARK: - Navigation bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: UIColor(0x666666),
                                                       text: text.title1,
                                                       bar: primaryView.background,
                                                       translucent: true)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(currency: UIColor(0x000000),
                                       amount: UIColor(0x000000),
                                       regularAmount: UIColor(0x666666),
                                       badgeBackground: UIColor(0xFBB666),
                                       badgeCornerRadius: 6)
    }
}
