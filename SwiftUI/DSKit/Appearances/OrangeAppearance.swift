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
    public var primaryView: DSViewAppearanceProtocol
    public var secondaryView: DSViewAppearanceProtocol
    public var spacing: DSSpacingProtocol = DSSpacingSystem(spatialSystem: 7)
    public var padding: DPaddingsProtocol = DSPaddingSystem(spatialSystem: 7)
    public var dimension: DSDimensionProtocol = DSDimensionSystem(spatialSystem: 7)
    public var margins: CGFloat = 15
    public var groupMargins: CGFloat = 11
    public var interItemSpacing: CGFloat = 10
    public var tabBar: DSTabBarAppearanceProtocol
    public var navigationBar: DSNavigationBarAppearanceProtocol
    public var price: DSPriceAppearanceProtocol
    public var fonts: DSFontsProtocol = DSFonts()
    public var actionElementHeight: CGFloat = 48
    
    
    public init(brandColor: UIColor? = nil, title: String = "Orange") {
        
        self.title = title
        
        // MARK: - Primary view
        
        let text = DSTextAppearance.textColors(
            main: UIColor(0x353D50),
            secondary: UIColor(0x5B6170)
        )
        
        let button = DSButtonAppearance(
            accentColor: UIColor(0xF26333), 
            supportColor: UIColor(0xffffff)
        )
        
        let primaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xF6F7F8),
            background: UIColor(0xF6F7F8),
            text: text.headline,
            placeHolder: UIColor(0xA6AAB3)
        )
        
        primaryView = DSViewAppearance(
            button: button,
            text: text,
            textField: primaryViewTextField,
            background: UIColor(0xffffff),
            separator: UIColor(0xF6F7F8),
            cornerRadius: 8
        )
        
        // MARK: - Secondary view
        
        let secondaryText = DSTextAppearance.textColors(
            main: UIColor(0x040C22),
            secondary: UIColor(0x5B6170)
        )
        
        let secondaryButton = DSButtonAppearance(
            accentColor: UIColor(0xF26333),
            supportColor: UIColor(0xffffff)
        )
        
        let secondaryViewTextField = DSTextFieldAppearance(
            border: UIColor(0xffffff),
            background: UIColor(0xffffff),
            text: text.headline,
            placeHolder: text.subheadline
        )
        
        secondaryView = DSViewAppearance(
            button: secondaryButton,
            text: secondaryText,
            textField: secondaryViewTextField,
            background: UIColor(0xF6F7F8),
            separator: UIColor(0xffffff),
            cornerRadius: 8
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
            currency: UIColor(0xF26333),
            amount: UIColor(0xF26333),
            regularAmount: UIColor(0x5B6170),
            badgeBackground: UIColor(0xFE4850),
            badgeCornerRadius: 5
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
