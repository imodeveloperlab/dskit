//
//  TextFieldColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Text field colors
public struct DSDesignableTextFieldColor: Equatable, Hashable {
    
    /// Init designable text field color
    /// - Parameters:
    ///   - border: UIColor
    ///   - background: UIColor
    ///   - text: UIColor
    ///   - placeHolder: UIColor
    public init(border: UIColor,
                background: UIColor,
                text: UIColor,
                placeHolder: UIColor) {
        self.border = border
        self.background = background
        self.text = text
        self.placeHolder = placeHolder
    }
    
    /// Border color
    public var border: UIColor
    
    /// Background color
    public var background: UIColor
    
    /// Text color
    public var text: UIColor
    
    /// Placeholder color
    public var placeHolder: UIColor
}
