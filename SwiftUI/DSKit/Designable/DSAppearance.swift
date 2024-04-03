//
//  Designable.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI
import UIKit

struct AppearanceEnvironment: EnvironmentKey {
    static let defaultValue: DSAppearance = DSKitAppearance()
}

public extension EnvironmentValues {
    var appearance: DSAppearance {
        get { self[AppearanceEnvironment.self] }
        set { self[AppearanceEnvironment.self] = newValue }
    }
}

public protocol DSAppearance {
    var title: String { get set }
    var brandColor: UIColor { get set }
    var primaryView: DSDesignableViewStyle { get set }
    var secondaryView: DSDesignableViewStyle { get set }
    var statusBarStyleForDarkUserInterfaceStyle: UIStatusBarStyle { get set }
    var statusBarStyleForLightUserInterfaceStyle: UIStatusBarStyle { get set }
    var spacing: DSDesignableSpacing { get set }
    var padding: DSDesignablePadding { get set }
    var dimension: DSDesignableDimension { get set }
    var tabBar: DSDesignableTabbarColor { get set }
    var navigationBar: DSDesignableNavigationBarColor { get set }
    var price: DSDesignablePriceColor { get set }
    var fonts: DSDesignableFonts { get set }
    var prefersLargeTitles: Bool { get set }
    var actionElementHeight: CGFloat { get set }
    var darkModeSupport: Bool { get }
    
    func style(for viewStyle: DSViewStyle) -> DSDesignableViewStyle
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
