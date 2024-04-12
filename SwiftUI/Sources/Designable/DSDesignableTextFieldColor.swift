//
//  TextFieldColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSTextFieldColors: DSTextFieldColorsProtocol {
    
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
