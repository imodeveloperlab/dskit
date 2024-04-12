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
    var primaryView: DSViewAppearanceProtocol { get set }
    var secondaryView: DSViewAppearanceProtocol { get set }
    var spacing: DSSpacingProtocol { get set }
    var padding: DPaddingsProtocol { get set }
    var tabBar: DSTabBarAppearanceProtocol { get set }
    var navigationBar: DSNavigationBarAppearanceProtocol { get set }
    var price: DSPriceAppearanceProtocol { get set }
    var fonts: DSFontsProtocol { get set }
    var actionElementHeight: CGFloat { get set }
    var screenMargins: CGFloat { get set }
    func style(for viewStyle: DSViewStyle) -> DSViewAppearanceProtocol
}

extension DSAppearance {
    func color(for colorKey: DSColorKey, viewStyle: DSViewStyle) -> Color {
        colorKey.color(for: self, and: viewStyle)
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
