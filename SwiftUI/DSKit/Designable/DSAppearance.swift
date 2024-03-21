//
//  Designable.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public protocol DSAppearance {
    
    /// Appearance title
    var title: String { get set }
    
    /// Brand color
    var brandColor: UIColor { get set }
    
    /// Primary view colors
    var primaryView: DSDesignableViewColors { get set }
    
    /// Secondary view colors
    var secondaryView: DSDesignableViewColors { get set }
    
    /// Status bar
    var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle { get set }
    var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle { get set }
    
    /// Margins and spaces
    var size: DSDesignableSize { get set }
    
    /// Tabbar colors
    var tabBar: DSDesignableTabbarColor { get set }
    
    /// Navigation Bar colors
    var navigationBar: DSDesignableNavigationBarColor { get set }
    
    /// Currency color and amount color
    var price: DSDesignablePriceColor { get set }
    
    /// Fonts
    var fonts: DSDesignableFonts { get set }
    
    /// Do we prefer large titles on screens?
    var prefersLargeTitles: Bool { get set }
    
    /// Action element height
    var actionElementHeight: CGFloat { get set }
    
    var darkModeSupport: Bool { get }
}

public extension DSAppearance {
    
    /// Get status bar for user interface style
    /// - Parameter style: UIUserInterfaceStyle
    /// - Returns: UIStatusBarStyle
    func statusBarStyle(for style: UIUserInterfaceStyle) -> UIStatusBarStyle {
        
        switch style {
        case .dark:
            return statusBarStyleForDarkUserInterfaceStyle
        case .light:
            return statusBarStyleForLightUserInterfaceStyle
        case .unspecified:
            return statusBarStyleForLightUserInterfaceStyle
        @unknown default:
            return statusBarStyleForLightUserInterfaceStyle
        }
    }
}

public extension DSAppearance {
    func overrideTheSystemAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = self.navigationBar.bar
        
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: self.navigationBar.text,
            NSAttributedString.Key.font: self.fonts.headline
        ]
        
        navigationBarAppearance.backButtonAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: self.navigationBar.buttons,
            NSAttributedString.Key.font: self.fonts.headline
        ]
        
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: self.primaryView.text.title1,
            NSAttributedString.Key.font: self.fonts.headline.withSize(30)
        ]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    }
}
