//
//  BackgroundColors.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View colors
public struct DSDesignableViewColors: Equatable, Hashable {
    
    /// Init designable view colors
    /// - Parameters:
    ///   - button: DSDesignableButtonColor
    ///   - text: DSDesignableTextColor
    ///   - background: UIColor
    ///   - separator: UIColor
    ///   - cornerRadius: CGFloat
    public init(button: DSDesignableButtonColor,
                text: DSDesignableTextColor,
                textField: DSDesignableTextFieldColor,
                background: UIColor,
                separator: UIColor,
                cornerRadius: CGFloat) {
        
        self.button = button
        self.text = text
        self.background = background
        self.separator = separator
        self.cornerRadius = cornerRadius
        self.textField = textField
    }
    
    /// Any button on, view colors
    public var button: DSDesignableButtonColor
    
    /// Any text on, view colors
    public var text: DSDesignableTextColor
    
    /// Any textfield on, view colors
    public var textField: DSDesignableTextFieldColor
    
    /// View background colors
    public var background: UIColor
    
    /// View separator colors
    public var separator: UIColor
    
    /// View corner radius
    public var cornerRadius: CGFloat
}
