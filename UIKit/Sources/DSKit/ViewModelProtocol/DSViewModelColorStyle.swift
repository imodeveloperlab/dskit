//
//  DSViewModelColorStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model display style
public enum DSViewModelColorStyle: Equatable, Hashable {
    
    case `default`
    case primary
    case secondary
    case custom(DSDesignableViewColors)
    
    /// Raw value
    var rawValue: String {
        switch self {
        case .primary:
            return "primary"
        case .secondary:
            return "secondary"
        case .custom(_):
            return "custom"
        case .default:
            return "default"
        }
    }
}
