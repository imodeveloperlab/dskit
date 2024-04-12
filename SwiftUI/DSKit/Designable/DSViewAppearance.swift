//
//  BackgroundColors.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public protocol DSViewAppearanceProtocol {
    var button: DSButtonAppearanceProtocol { get }
    var text: DSTextAppearanceProtocol { get }
    var textField: DSTextFieldAppearanceProtocol { get }
    var background: UIColor { get }
    var separator: UIColor { get }
    var cornerRadius: CGFloat { get }
}

public extension DSViewAppearanceProtocol {
    func color(for viewColor: DSViewColorKey, appearance: DSAppearance, style: DSViewStyle) -> Color {
        switch viewColor {
        case .buttonAccentColor:
            button.accentColor.color
        case .buttonSupportColor:
            button.supportColor.color
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

public enum DSViewColorKey: Equatable, Hashable {
    case buttonAccentColor
    case buttonSupportColor
    case background
    case separator
    case textFieldBorder
    case textFieldBackground
    case textFieldText
    case textFieldPlaceholder
    case text(DSTextColorKey)
}

public struct DSViewAppearance: DSViewAppearanceProtocol {
    
    public init(
        button: DSButtonAppearanceProtocol,
        text: DSTextAppearanceProtocol,
        textField: DSTextFieldAppearanceProtocol,
        background: UIColor,
        separator: UIColor,
        cornerRadius: CGFloat
    ) {
        
        self.button = button
        self.text = text
        self.background = background
        self.separator = separator
        self.cornerRadius = cornerRadius
        self.textField = textField
    }
    
    public var button: DSButtonAppearanceProtocol
    public var text: DSTextAppearanceProtocol
    public var textField: DSTextFieldAppearanceProtocol
    public var background: UIColor
    public var separator: UIColor
    public var cornerRadius: CGFloat
}

