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
    func color(for viewKey: DSViewColorKey, appearance: DSAppearance, style: DSViewStyle) -> Color {
        switch viewKey {
        case .button(let buttonKey):
            button.color(key: buttonKey)
        case .background:
            background.color
        case .separator:
            separator.color
        case .textField(let textFieldKey):
            textField.color(key: textFieldKey)
        case .text(let textKey):
            textKey.color(for: appearance, and: style)
        }
    }
}

public enum DSViewColorKey: Equatable, Hashable {
    case background
    case separator
    case button(DSButtonColorKey)
    case textField(DSTextFieldColorKey)
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

