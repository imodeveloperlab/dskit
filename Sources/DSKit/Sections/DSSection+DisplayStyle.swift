//
//  DSSection+Identifiers.swift
//  DSKit
//
//  Created by Borinschi Ivan on 15.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension Array where Element == DSSection {
    
    /// Update display style for view models in dependence of section background `style`
    func prepareViewModelsDisplayStyle() {
        
        for section in self {
            
            for (index, model) in section.viewModels.enumerated() {
                
                var model = model
                
                /// If section fave groupBackground then set view model display style to `.default`
                /// because the view model in grouped section should be displayed as `.default`
                if section.background.isGrouped {
                    model.style.displayStyle = .grouped(inSection: true)
                }
                
                switch section.background {
                case .grouped:
                    model.style.displayStyle = .grouped(inSection: true)
                
                case .primaryBackground:
                    
                    switch model.style.colorStyle {
                    case .custom(_), .primary, .secondary:
                        break
                    case .default:
                        model.style.colorStyle = .secondary
                    }
                    
                case .secondaryBackground:
                    
                    switch model.style.colorStyle {
                    case .custom(_), .primary, .secondary:
                        break
                    case .default:
                        model.style.colorStyle = .primary
                    }
                case .default:
                    break
                }
                
                /// Replace view model at index with updated view model
                section.viewModels[index] = model
            }
        }
    }
}
