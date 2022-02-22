//
//  DSSection+Width.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

extension DSSection {
    
    /// Get section display width in layoutEnvironment
    /// - Parameter layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: CGFloat
    func sectionWidth(_ layoutEnvironment: NSCollectionLayoutEnvironment?) -> CGFloat {
        
        // Set initial width
        var width: CGFloat = 0
        if let contentSizeWidth = layoutEnvironment?.container.contentSize.width {
            width = contentSizeWidth
        } else {
            width = UIScreen.main.bounds.width
        }
        
        // If section is grouped, then remove spacing
        if self.background.isGrouped {
            width -= DSAppearance.shared.main.groupMargins * 2
        }
        
        // Remove section insets width
        width -= self.insets.width
        
        return width
    }
    
    /// Get section display width in layoutEnvironment
    /// - Parameter layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: CGFloat
    func sectionHeight(_ layoutEnvironment: NSCollectionLayoutEnvironment?) -> CGFloat {
        
        // Set initial width
        var height: CGFloat = 0
        if let contentSizeHeight = layoutEnvironment?.container.contentSize.height {
            height = contentSizeHeight
        } else {
            height = UIScreen.main.bounds.height
        }
        
        // If section is grouped, then remove spacing
        if self.background.isGrouped {
            height -= DSAppearance.shared.main.groupMargins * 2
        }
        
        // Remove section insets width
        height -= self.insets.width
        
        return height
    }
}
