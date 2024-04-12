//
//  DSViewModelDisplayStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model display style
public enum DSViewModelDisplayStyle: Equatable, Hashable {
    
    case `default` //Edge to edge with no margins
    case grouped(inSection: Bool) // DSDesignable groupMargins will be applied to each side in dependence in which context this view model is shown
    
    /// Raw value
    var rawValue: String {
        switch self {
        case .default:
            return "Default"
        case .grouped(inSection: let inSection):
            if inSection {
                return "SectionGrouped"
            } else {
                return "Grouped"
            }
        }
    }
}
