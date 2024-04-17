//
//  UILabelExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UILabel {
    
    func set(text: DSTextComposer, designableTextColor: DSDesignableTextColor) {        
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: 8)
        attributedText = text.attributedString(designableTextColor: designableTextColor)
    }
    
    func setStyle(type: DSTextType, designableTextColor: DSDesignableTextColor) {
        self.textColor = type.style.color.getColor(designableTextColor: designableTextColor)
        self.font = type.style.font.getFont()
    }
}
