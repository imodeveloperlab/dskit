//
//  PeachAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class PeachAppearance: DSAppearance {
    
    public var title: String
    public var darkModeSupport: Bool = false
    public var brandColor: UIColor
    public var primaryView: DSDesignableViewStyle
    public var secondaryView: DSDesignableViewStyle
    public var spacing: DSDesignableSpacing = DSDefaultDesignableSpacing(spatialSystem: 7)
    public var padding: DSDesignablePadding = DSDefaultDesignablePadding(spatialSystem: 7)
    public var dimension: DSDesignableDimension = DSDefaultDesignableDimension(spatialSystem: 7)
    public var margins: CGFloat = 15
    public var groupMargins: CGFloat = 10
    public var interItemSpacing: CGFloat = 10
    public var tabBar: DSDesignableTabbarColor
    public var navigationBar: DSDesignableNavigationBarColor
    public var price: DSDesignablePriceColor
    public var fonts = DSDesignableFonts()
    public var prefersLargeTitles: Bool = true
    public var actionElementHeight: CGFloat = 48
    public var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle = .darkContent
    public var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle = .darkContent
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Peach") {
        
        self.title = title
        self.brandColor = brandColor ?? UIColor(0xFF5A5F)
        
        // MARK: - Primary view
        
        let text = DSDesignableTextColor.textColors(main: UIColor(0x484848), secondary: UIColor(0x767676))
        let button = DSDesignableButtonColor(background: UIColor(0xFF5A5F), title: UIColor(0xffffff))
        let secondaryButton = DSDesignableButtonColor(background: UIColor(0xFF5A5F), title: UIColor(0xffffff))
        let primaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xF4F4F4),
                                                              background: UIColor(0xF4F4F4),
                                                              text: text.headline,
                                                              placeHolder: text.subheadline)
        
        primaryView = DSDesignableViewStyle(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: UIColor(0xFFFFFF),
                                             separator: UIColor(0xD5C5B2),
                                             cornerRadius: 12)
        
        // MARK: - Secondary view
        
        let secondaryText = DSDesignableTextColor.textColors(main: UIColor(0x222222), secondary: UIColor(0x717171))
        let secondaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xFFFFFF),
                                                                background: UIColor(0xFFFFFF),
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        
        secondaryView = DSDesignableViewStyle(button: secondaryButton,
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: UIColor(0xF4F4F4),
                                               separator: UIColor(0xEBEBEB),
                                               cornerRadius: 12)
        
        // MARK: - Tabbar
        
        tabBar = DSDesignableTabbarColor(barTint: primaryView.background,
                                         itemTint: primaryView.button.background,
                                         unselectedItemTint: secondaryText.subheadline,
                                         badge: self.brandColor,
                                         translucent: true)
        
        // MARK: - Navigation Bar
        
        navigationBar = DSDesignableNavigationBarColor(buttons: self.brandColor,
                                                       text: text.title1,
                                                       bar: primaryView.background,
                                                       translucent: true)
        
        // MARK: - Price
        
        price = DSDesignablePriceColor(currency: UIColor(0xFC642D),
                                       amount: UIColor(0xFC642D),
                                       regularAmount: UIColor(0x4A1F0F),
                                       badgeBackground: UIColor(0xFF5A5F),
                                       badgeCornerRadius: 6)
    }
    
    public func style(for viewStyle: DSViewStyle) -> DSDesignableViewStyle {
        return switch viewStyle {
        case .primary:
            primaryView
        case .secondary:
            secondaryView
        }
    }
}
