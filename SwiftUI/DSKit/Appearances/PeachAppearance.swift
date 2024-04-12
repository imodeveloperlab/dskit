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
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 7)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 7)
    public var dimension: DSDimensionProtocol = DSDimensionSystem(spatialSystem: 7)
    public var margins: CGFloat = 15
    public var groupMargins: CGFloat = 10
    public var interItemSpacing: CGFloat = 10
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 48
    
    /// Init system appearance with brand color, or primary color of your app
    /// - Parameter primaryBrandColor: UIColor
    public init(brandColor: UIColor? = nil, title: String = "Peach") {
        
        self.title = title
        
        // MARK: - Primary view
        
        let text = DSTextAppearance.textColors(
            main: UIColor(0x484848), 
            secondary: UIColor(0x767676)
        )
        
        let button = DSButtonAppearance(
            accentColor: UIColor(0xFF5A5F),
            supportColor: UIColor(0xffffff)
        )
        
        let secondaryButton = DSButtonAppearance(
            accentColor: UIColor(0xFF5A5F),
            supportColor: UIColor(0xffffff)
        )
        
        let primaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xF4F4F4),
            background: UIColor(0xF4F4F4),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: UIColor(0xFFFFFF),
            separator: UIColor(0xD5C5B2),
            cornerRadius: 12
        )
        
        // MARK: - Secondary view
        
        let secondaryText = DSTextAppearance.textColors(
            main: UIColor(0x222222),
            secondary: UIColor(0x717171)
        )
        
        let secondaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xFFFFFF),
            background: UIColor(0xFFFFFF),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        secondaryView = DSViewAppearance(
            button: secondaryButton,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: UIColor(0xF4F4F4),
            separator: UIColor(0xEBEBEB),
            cornerRadius: 12
        )
        
        // MARK: - Tabbar
        
        tabBar = DSTabbarAppearance(
            barTint: primaryView.background,
            itemTint: primaryView.button.accentColor,
            unselectedItemTint: secondaryText.subheadline,
            badge: primaryView.button.accentColor,
            translucent: true
        )
        
        // MARK: - Navigation Bar
        
        navigationBar = DSNavigationBarAppearance(
            buttons: primaryView.button.accentColor,
            text: text.title1,
            bar: primaryView.background,
            translucent: true
        )
        
        // MARK: - Price
        
        price = DSPriceAppearance(
            currency: UIColor(0xFC642D),
            amount: UIColor(0xFC642D),
            regularAmount: UIColor(0x4A1F0F),
            badgeBackground: UIColor(0xFF5A5F),
            badgeCornerRadius: 6
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
