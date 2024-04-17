//
//  DSDesignableNavigationBarColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Navigation bar colors
public struct DSDesignableNavigationBarColor {
    
    /// Init navigation bar colors
    /// - Parameters:
    ///   - buttons: UIColor
    ///   - text: UIColor
    ///   - bar: UIColor
    ///   - translucent: Bool
    public init(buttons: UIColor, text: UIColor, bar: UIColor, translucent: Bool = false) {
        self.buttons = buttons
        self.text = text
        self.bar = bar
        self.translucent = translucent
    }
    
    /// Buttons color
    public var buttons: UIColor
    /// Text color
    public var text: UIColor
    /// Bar color
    public var bar: UIColor
    /// Translucent
    public var translucent: Bool
}
