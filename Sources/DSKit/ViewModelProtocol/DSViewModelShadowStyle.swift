//
//  DSViewModelShadowStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model display style
public enum DSViewModelShadowStyle: Equatable, Hashable {
    
    case none
    case small
    case light
    
    /// Raw value
    var rawValue: String {
        
        switch self {
        case .none:
            return "none"
        case .small:
            return "small"
        case .light:
            return "light"
        }
    }
}
