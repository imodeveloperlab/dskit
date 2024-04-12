//
//  DSNavigationBarAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public protocol DSNavigationBarAppearanceProtocol {
    var buttons: UIColor { get set }
    var text: UIColor { get set }
    var bar: UIColor { get set }
    var translucent: Bool { get set }
}

extension DSNavigationBarAppearanceProtocol {
    func color(key: DSNavigationBarColor) -> Color {
        switch key {
        case .button:
            buttons.color
        case .text:
            text.color
        case .bar:
            bar.color
        }
    }
}

public enum DSNavigationBarColor {
    case button
    case text
    case bar
}

public struct DSNavigationBarAppearance: DSNavigationBarAppearanceProtocol {
    public init(
        buttons: UIColor,
        text: UIColor,
        bar: UIColor,
        translucent: Bool = false
    ) {
        self.buttons = buttons
        self.text = text
        self.bar = bar
        self.translucent = translucent
    }
    
    public var buttons: UIColor
    public var text: UIColor
    public var bar: UIColor
    public var translucent: Bool
}
