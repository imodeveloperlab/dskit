//
//  DSViewModel+Designable.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSViewModel {
    
    /// Get view colors for view model based on `display` style
    /// - Parameter mirrored: Inert secondaryView  with primaryView colors, works only with `default` color style
    /// - Returns: DSDesignableViewColors
    func viewColors(mirrored: Bool = false) -> DSDesignableViewColors {
        
        switch style.colorStyle {
        
        case .default:
            
            if mirrored {
                
                switch style.displayStyle {
                case .default:
                    return DSAppearance.shared.main.secondaryView
                case .grouped(inSection: let inSection):
                    
                    if inSection {
                        return DSAppearance.shared.main.primaryView
                    } else {
                        return DSAppearance.shared.main.secondaryView
                    }
                }
                
            } else {
                switch style.displayStyle {
                case .default:
                    return DSAppearance.shared.main.primaryView
                case .grouped(inSection: _):
                    return DSAppearance.shared.main.secondaryView
                }
            }
            
        case .primary:
            return DSAppearance.shared.main.primaryView
        case .secondary:
            return DSAppearance.shared.main.secondaryView
        case .custom(let colors):
            return colors
        }
    }
}
