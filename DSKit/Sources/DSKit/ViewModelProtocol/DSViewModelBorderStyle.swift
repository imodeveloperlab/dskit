//
//  DSViewModelBorderStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model display style
public enum DSViewModelBorderStyle: Equatable, Hashable {
    
    case none
    case buttonColor
    case brandColor
    case custom(width: CGFloat, color: UIColor)
    
    /// Raw value
    var rawValue: String {
        
        switch self {
        case .none:
            return "none"
        case .buttonColor:
            return "buttonColor"
        case .brandColor:
            return "brandColor"
        case .custom(let width, let color):
            return "\(width)\(color.dsDescription)"
        }
    }
}
