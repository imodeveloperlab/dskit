//
//  DSViewModelDisplayStyle+UIEdgeInsets.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSViewModelDisplayStyle {
    
    /// Get view insets based on DSViewModelDisplayStyle
    /// - Returns: UIEdgeInsets
    func viewInsets() -> UIEdgeInsets {
        
        switch self {
        case .default:
            return .zero
        case .grouped(inSection: let inSection):
            
            if inSection {
                return .zero
            } else {
                return DSAppearance.shared.main.groupMargins.edgeInsets
            }
        }
    }
    
    /// Get view insets when this view model is displayed as supplementary view
    /// - Parameters:
    ///   - section: DSSection
    ///   - kind: String, supplementary view kind
    /// - Returns: UIEdgeInsets
    func supplementaryViewInsets(section: DSSection, kind: String) -> UIEdgeInsets {
        
        if kind == UICollectionView.elementKindSectionHeader {
            return UIEdgeInsets(top: DSAppearance.shared.main.margins, left: 0, bottom: -5, right: 0)
        } else if kind == UICollectionView.elementKindSectionFooter {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        return .zero
    }
}
