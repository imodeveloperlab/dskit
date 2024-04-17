//
//  DSViewModelCornersStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model corner style
public enum DSViewModelCornersStyle: Equatable, Hashable {
    
    case `default`
    case zero
    case custom(CGFloat)
    
    /// Raw value
    var rawValue: String {
        switch self {
        case .zero:
            return "zero"
        case .default:
            return "default"
        case .custom(let cornerRadius):
            return "custom_\(cornerRadius)"
        }
    }
}
