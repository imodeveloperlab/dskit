//
//  BackgroundColors.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

/// View colors
public struct DSDesignableViewStyle: Equatable, Hashable {
    
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

extension DSDesignableViewStyle {
    
    func color(for viewColor: DSViewColor, appearance: DSAppearance, style: DSViewStyle) -> Color {
        switch viewColor {
        case .buttonBackground:
            button.background.color
        case .buttonTitle:
            button.title.color
        case .background:
            background.color
        case .separator:
            separator.color
        case .textFieldBorder:
            textField.border.color
        case .textFieldBackground:
            textField.background.color
        case .textFieldText:
            textField.text.color
        case .textFieldPlaceholder:
            textField.placeHolder.color
        case .text(let textColor):
            textColor.color(for: appearance, and: style)
        }
    }
}
