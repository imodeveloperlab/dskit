//
//  DSImageTintColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSImageTintColor: Equatable, Hashable {
    
    case `default`
    case text(DSTextColor)
    case custom(UIColor)
    
    public var rawValue: String {
        switch self {
        case .text(_):
            return "DSImageTintColorTextColor"
        case .custom(_):
            return "DSImageTintColorCustom"
        case .default:
            return "DSImageTintColorDefault"
        }
    }
}

extension UIImageView {
    
    func setImageTintColor(_ color: DSImageTintColor, designableViewColors: DSDesignableViewColors) {

        switch color {
        case .text(let textColor):
            tintColor = textColor.getColor(designableTextColor: designableViewColors.text)
        case .custom(let uiColor):
            tintColor = uiColor
        case .default:
            tintColor = designableViewColors.text.subheadline
        }
    }
}
