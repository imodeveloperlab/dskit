//
//  String+EstimatedHeight.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension String {
    
    /// Get estimated height for text
    /// - Parameters:
    ///   - textType: DSTextType
    ///   - section: DSSection
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: DSViewModelHeight
    func estimatedHeight(textType: DSTextType, section: DSSection, _ layoutEnvironment: NSCollectionLayoutEnvironment?) -> DSViewModelHeight {
        
        let width = section.sectionWidth(layoutEnvironment)
        let height = self.height(forFixedWidth: width, font: textType.style.font.getFont())
        return .estimated(height)
    }
}
