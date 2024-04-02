//
//  OrangeAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class OrangeAppearance: DSAppearance {
    
    public var title: String
    public var darkModeSupport: Bool = false
    public var brandColor: UIColor
    public var primaryView: DSDesignableViewStyle
    public var secondaryView: DSDesignableViewStyle
    public var spacing: DSDesignableSpacing = DSDefaultDesignableSpacing(spatialSystem: 7)
    public var padding: DSDesignablePadding = DSDefaultDesignablePadding(spatialSystem: 7)
    public var dimension: DSDesignableDimension = DSDefaultDesignableDimension(spatialSystem: 7)
    public var margins: CGFloat = 15
    public var groupMargins: CGFloat = 11
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
    public init(brandColor: UIColor? = nil, title: String = "Orange") {
        
        self.title = title
        self.brandColor = brandColor ?? UIColor(0xF26333)
        
        // MARK: - Primary view
        
        let text = DSDesignableTextColor.textColors(main: UIColor(0x353D50), secondary: UIColor(0x5B6170))
        let button = DSDesignableButtonColor(background: UIColor(0xF26333), title: UIColor(0xffffff))
        
        let primaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xF6F7F8),
                                                              background: UIColor(0xF6F7F8),
                                                              text: text.headline,
                                                              placeHolder: UIColor(0xA6AAB3))
        
        primaryView = DSDesignableViewStyle(button: button,
                                             text: text,
                                             textField: primaryViewTextField,
                                             background: UIColor(0xffffff),
                                             separator: UIColor(0xF6F7F8),
                                             cornerRadius: 8)
        
        // MARK: - Secondary view
        
        let secondaryText = DSDesignableTextColor.textColors(main: UIColor(0x040C22), secondary: UIColor(0x5B6170))
        let secondaryButton = DSDesignableButtonColor(background: UIColor(0xF26333), title: UIColor(0xffffff))
        let secondaryViewTextField = DSDesignableTextFieldColor(border: UIColor(0xffffff),
                                                                background: UIColor(0xffffff),
                                                                text: text.headline,
                                                                placeHolder: text.subheadline)
        
        secondaryView = DSDesignableViewStyle(button: secondaryButton,
                                               text: secondaryText,
                                               textField: secondaryViewTextField,
                                               background: UIColor(0xF6F7F8),
                                               separator: UIColor(0xffffff),
                                               cornerRadius: 8)
        
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
        
        price = DSDesignablePriceColor(currency: UIColor(0xF26333),
                                       amount: UIColor(0xF26333),
                                       regularAmount: UIColor(0x5B6170),
                                       badgeBackground: UIColor(0xFE4850),
                                       badgeCornerRadius: 5)
    }
    
    public func style(for viewStyle: DSViewStyle) -> DSDesignableViewStyle {
        return switch viewStyle {
        case .screen:
            primaryView
        case .secondary:
            secondaryView
        }
    }
}
