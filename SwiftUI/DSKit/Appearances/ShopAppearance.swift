//
//  ShopAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class ShopAppearance: DSAppearance {
    
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
    public var size: DSDesignableSize = DSDefaultDesignableSize(spatialSystem: 7)
    
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
    public var actionElementHeight: CGFloat = 48
    
    // Status bar styles
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .darkContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Shop") {
        
        self.title = title
        self.brandColor = brandColor ?? DSDynamicColor.color(light: 0x1DA1F2, dark: 0x1DA1F2)
        
        // MARK: - Primary view
        
        let text = DSDesignableTextColor.textColors(main: UIColor(0x484848), secondary: UIColor(0x767676))
        let button = DSDesignableButtonColor(background: UIColor(0x006EB9), title: UIColor(0xffffff))
        let primaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xF4F4F4),
                                                              background: UIColor(0xF4F4F4),
                                                              text: text.headline,
                                                              placeHolder: text.subheadline)
        
        primaryView = DSDesignableViewColors(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: UIColor(0xFFFFFF),
                                             separator: UIColor(0xD5C5B2),
                                             cornerRadius: 10)
        
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
                                               cornerRadius: 10)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: primaryView.background,
                                         itemTint: primaryView.button.background,
                                         unselectedItemTint: secondaryText.subheadline,
                                         badge: self.brandColor,
                                         translucent: true)
        
        // MARK: - Navigation Bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: UIColor(0x3C4856),
                                                       text: text.title1,
                                                       bar: primaryView.background,
                                                       translucent: true)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(currency: UIColor(0x1DA1F2),
                                       amount: UIColor(0x1DA1F2),
                                       regularAmount: UIColor(0xA0ACBD),
                                       badgeBackground: UIColor(0x3C4856),
                                       badgeCornerRadius: 6)
    }
}
