//
//  DSCollectionView+GridLayout.swift
//  DSKit
//
//  Created by Borinschi Ivan on 29.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSCollectionView {
    
    /// Grid layout for section
    /// - Parameters:
    ///   - section: DSSection
    ///   - rows: Row index
    /// - Returns: NSCollectionLayoutSection?
    func gridLayout(section: DSGridSection, columns: Int, _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        
        guard let model = section.viewModels.first else {
            return nil
        }
        
        let height = model.height(layoutEnvironment, section: section)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(CGFloat(1.0 / Double(columns))),
                                              heightDimension: height.dimension())
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: height.dimension())
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
        
        // Inter item spacing
        group.interItemSpacing = .fixed(section.interItemSpacing)
        let collectionSection = NSCollectionLayoutSection(group: group)
        collectionSection.orthogonalScrollingBehavior = .none
        
        // Inter group spacing
        collectionSection.interGroupSpacing = section.interItemSpacing
        
        // Content insets
        switch section.background {
        case .grouped:
            let margin = DSAppearance.shared.main.groupMargins
            let insets = section.insets.add(margin).directionalEdgeInsets
            collectionSection.contentInsets = insets
        case .`default`, .primaryBackground, .secondaryBackground:
            collectionSection.contentInsets = section.insets.directionalEdgeInsets
        }
        
        return applyDefaultSupplementaryViewLayout(section: section, collectionLayoutSection: collectionSection, group: group, layoutEnvironment)
    }
}
