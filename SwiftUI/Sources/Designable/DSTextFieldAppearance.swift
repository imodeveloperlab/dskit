//
//  TextFieldColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public protocol DSTextFieldAppearanceProtocol {
    var border: UIColor { get set }
    var background: UIColor { get set }
    var text: UIColor { get set }
    var placeHolder: UIColor { get set }
}

public extension DSTextFieldAppearanceProtocol {
    func color(key: DSTextFieldColorKey) -> Color {
        switch key {
        case .border:
            border.color
        case .background:
            background.color
        case .text:
            text.color
        case .placeholder:
            placeHolder.color
        }
    }
}

public enum DSTextFieldColorKey {
    case border
    case background
    case text
    case placeholder
}

public struct DSTextFieldAppearance: DSTextFieldAppearanceProtocol {
    
    public init(
        border: UIColor,
        background: UIColor,
        text: UIColor,
        placeHolder: UIColor
    ) {
        self.border = border
        self.background = background
        self.text = text
        self.placeHolder = placeHolder
    }
    
    public var border: UIColor
    public var background: UIColor
    public var text: UIColor
    public var placeHolder: UIColor
}
