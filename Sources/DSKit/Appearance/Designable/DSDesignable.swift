//
//  Designable.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public protocol DSDesignable {
    
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
    var margins: CGFloat { get set }
    var groupMargins: CGFloat { get set }
    var interItemSpacing: CGFloat { get set }
    
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
    
    /// Buttons height
    var buttonsHeight: CGFloat { get set }
}

extension DSDesignable {
    
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

public extension DSDesignable {
    
    /// Semantic green color deviated from brand color
    var semanticGreenColor: UIColor {
        brandColor.semanticGreenColor
    }
    
    /// Semantic red color deviated from brand color
    var semanticRedColor: UIColor {
        brandColor.semanticRedColor
    }
    
    /// Semantic yellow deviated from brand color
    var semanticYellowColor: UIColor {
        brandColor.semanticYellowColor
    }
    
    /// Semantic blue color deviated from brand color
    var semanticBlueColor: UIColor {
        brandColor.semanticBlueColor
    }
}
