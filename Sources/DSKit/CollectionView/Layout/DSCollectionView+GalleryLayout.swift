//
//  DSCollectionView+GalleryLayout.swift
//  DSKit
//
//  Created by Borinschi Ivan on 29.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSCollectionView {
    
    /// Gallery layout for section
    /// - Parameter section: DSSection
    /// - Returns: NSCollectionLayoutSection?
    func galleryLayout(section: DSGallerySection, _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        
        var behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none
        var subitems = [NSCollectionLayoutItem]()
        var groupHeight: NSCollectionLayoutDimension = .estimated(40)
        var groupWidth: NSCollectionLayoutDimension = .absolute(layoutEnvironment.container.contentSize.width)
        
        // Set size for each subitem
        for model in section.viewModels {
            
            // Item Setup
            let width = model.width(layoutEnvironment, section: section)
            let height = model.height(layoutEnvironment, section: section)
            let itemSize = NSCollectionLayoutSize(widthDimension: width.dimension(), heightDimension: height.dimension())
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            subitems.append(item)
            
            let behaviorAndWidth = getBehaviorAndWidthDimension(section: section, width: width, layoutEnvironment: layoutEnvironment)
            behavior = behaviorAndWidth.behavior
            
            // Group width / height
            groupHeight = height.dimension()
            groupWidth = behaviorAndWidth.width
        }
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: groupWidth, heightDimension: groupHeight)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: subitems)
        
        // Inter item spacing
        group.interItemSpacing = .fixed(section.interItemSpacing)
        let collectionSection = NSCollectionLayoutSection(group: group)
        collectionSection.orthogonalScrollingBehavior = behavior
        
        // Inter group spacing
        collectionSection.interGroupSpacing = section.interItemSpacing
        
        // Content insets
        switch section.background {
        case .grouped:
            let margin = DSAppearance.shared.main.groupMargins
            let insets = section.insets.add(margin).directionalEdgeInsets
            collectionSection.contentInsets = insets
        case .`default`, .primaryBackground, .secondaryBackground:
            switch section.galleryType {
            case .default:
                collectionSection.contentInsets = section.insets.directionalEdgeInsets
            case .fullWidth:
                collectionSection.contentInsets = section.insets.zeroLeftRightDirectionalEdgeInsets
            }
        }
        
        return applyDefaultSupplementaryViewLayout(section: section,
                                                   collectionLayoutSection: collectionSection,
                                                   group: group, layoutEnvironment)
    }
    
    /// Calculate and get Width and Behavior for section
    /// - Parameters:
    ///   - section: DSGallerySection
    ///   - width: DSViewModelWidth
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: (width: NSCollectionLayoutDimension, behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior)
    fileprivate func getBehaviorAndWidthDimension(section: DSGallerySection,
                                                  width: DSViewModelWidth,
                                                  layoutEnvironment: NSCollectionLayoutEnvironment) -> (width: NSCollectionLayoutDimension,
                                                                                                        behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior) {
        
        var widthDimension: NSCollectionLayoutDimension = .absolute(layoutEnvironment.container.contentSize.width)
        var behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior = .none
        
        if width.isFractional {
            
            if width.dimension().dimension == 1.0 {
                
                switch section.galleryType {
                case .default:
                    let margins: CGFloat = section.background.isGrouped ? DSAppearance.shared.main.groupMargins : 0
                    let insets = (margins + DSAppearance.shared.main.margins) * 2
                    widthDimension = .absolute(layoutEnvironment.container.contentSize.width - insets)
                case .fullWidth:
                    widthDimension = .absolute(view.frame.width)
                }
                
                behavior = .groupPaging
                
            } else {
                widthDimension = .estimated(layoutEnvironment.container.contentSize.width)
                behavior = .continuous
            }
            
        } else if width.isAbsolute {
            widthDimension = width.dimension()
            behavior = .continuous
        } else if width.isEstimated {
            widthDimension = width.dimension()
            behavior = .continuous
        }
        
        return (width: widthDimension, behavior: behavior)
    }
}
