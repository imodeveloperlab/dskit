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
    var background: UIColor { get set }
    var text: UIColor { get set }
    var placeHolder: UIColor { get set }
}

public extension DSTextFieldAppearanceProtocol {
    func color(key: DSTextFieldColorKey) -> Color {
        switch key {
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
    case background
    case text
    case placeholder
}

public struct DSTextFieldAppearance: DSTextFieldAppearanceProtocol {
    
    public init(
        background: UIColor,
        text: UIColor,
        placeHolder: UIColor
    ) {
        self.background = background
        self.text = text
        self.placeHolder = placeHolder
    }
    
    public var background: UIColor
    public var text: UIColor
    public var placeHolder: UIColor
}
