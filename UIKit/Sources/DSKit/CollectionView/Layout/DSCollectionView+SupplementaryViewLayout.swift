//
//  DSCollectionView+SupplementaryViewLayout.swift
//  DSKit
//
//  Created by Borinschi Ivan on 29.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension DSCollectionView {
    
    /// Layout for section, group and behavior
    /// - Parameters:
    ///   - section: DSSection
    ///   - group: NSCollectionLayoutGroup
    ///   - behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior
    /// - Returns: NSCollectionLayoutSection?
    func applyDefaultSupplementaryViewLayout(section: DSSection,
                                             collectionLayoutSection: NSCollectionLayoutSection,
                                             group: NSCollectionLayoutGroup,
                                             _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        
        // Supplementary view items
        if let supplementaryViewItems = supplementaryViewsItems(for: section, layoutEnvironment) {
            collectionLayoutSection.boundarySupplementaryItems = supplementaryViewItems
        }
        
        // Scroll handler
        collectionLayoutSection.visibleItemsInvalidationHandler = section.getScrollHandler(for: self)
        
        switch section.background {
        case .grouped:
            let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: DSCollectionView.sectionBackgroundDecorationElementKind)
            sectionBackgroundDecoration.contentInsets = sectionBackgroundEdgeInsets(section: section, layoutEnvironment)
            collectionLayoutSection.decorationItems = [sectionBackgroundDecoration]
        case .primaryBackground:
            let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: DSCollectionView.sectionBackgroundColorPrimaryDecorationElementKind)
            sectionBackgroundDecoration.contentInsets = .zero
            collectionLayoutSection.decorationItems = [sectionBackgroundDecoration]
        case .secondaryBackground:
            let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: DSCollectionView.sectionBackgroundColorSecondaryDecorationElementKind)
            sectionBackgroundDecoration.contentInsets = .zero
            collectionLayoutSection.decorationItems = [sectionBackgroundDecoration]
        case .`default`: break
        }
        
        return collectionLayoutSection
    }
    
    /// Get supplementary views
    /// - Parameters:
    ///   - section: DSSection
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: [NSCollectionLayoutBoundarySupplementaryItem]?
    func supplementaryViewsItems(for section: DSSection, _
                                    layoutEnvironment: NSCollectionLayoutEnvironment) -> [NSCollectionLayoutBoundarySupplementaryItem]? {
        
        var views = [NSCollectionLayoutBoundarySupplementaryItem]()
        
        //Header supplementary view
        if let header = section.header {
            views.append(supplementaryView(viewModel: header,
                                           section: section,
                                           position: .top,
                                           kind: UICollectionView.elementKindSectionHeader,
                                           layoutEnvironment))
        }
        
        //Footer supplementary view
        if let footer = section.footer {
            views.append(supplementaryView(viewModel: footer,
                                           section: section,
                                           position: .bottom,
                                           kind: UICollectionView.elementKindSectionFooter,
                                           layoutEnvironment))
        }
        
        return views.isEmpty ? nil : views
    }
    
    /// Get layout fo supplementaryView
    /// - Parameters:
    ///   - viewModel: DSViewModel
    ///   - section: DSSection
    ///   - position: NSRectAlignment
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: NSCollectionLayoutBoundarySupplementaryItem
    func supplementaryView(viewModel: DSViewModel,
                           section: DSSection,
                           position: NSRectAlignment,
                           kind: String,
                           _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutBoundarySupplementaryItem {
       
        let size = supplementaryViewLayoutSize(viewModel: viewModel,
                                               section: section,
                                               kind: kind,
                                               layoutEnvironment)
        
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size,
                                                           elementKind: kind,
                                                           alignment: position)
    }
    
    /// Get supplementary view size
    /// - Parameters:
    ///   - viewModel: DSViewModel
    ///   - section: DSSection
    ///   - position: NSRectAlignment
    ///   - kind: String
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    /// - Returns: NSCollectionLayoutSize
    func supplementaryViewLayoutSize(viewModel: DSViewModel,
                                     section: DSSection,
                                     kind: String,
                                     _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSize {
        
        var height = viewModel.height(layoutEnvironment, section: section)
        let insets = viewModel.style.displayStyle.supplementaryViewInsets(section: section, kind: kind)
        
        if height.dimension().isAbsolute {
            height = .absolute(insets.height + height.dimension().dimension)
        } else if height.dimension().isEstimated {
            height = .estimated(insets.height + height.dimension().dimension)
        }
        
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: height.dimension())
        return size
    }
    
    /// Section background edge insets
    /// Calculate section background insets
    /// - Parameter section: NSDirectionalEdgeInsets
    /// - Returns: DSSection
    func sectionBackgroundEdgeInsets(section: DSSection, _ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSDirectionalEdgeInsets {
        
        var headerInsets: CGFloat = 0
        var footerInsets: CGFloat = 0
 
        /// Insets for view model in section
        /// - Parameters:
        ///   - viewModel: DSViewModel
        ///   - section: DSSection
        /// - Returns: CGFloat
        func heightFor(viewModel: DSViewModel, section: DSSection, kind: String) -> CGFloat {
            
            var height: CGFloat = 0
            
            if let heightForHash = DSReusableCollectionViewsHeightManager.shared.heightFor(viewModel: viewModel, in: section) {

                height = heightForHash

             } else {

                let size = supplementaryViewLayoutSize(viewModel: viewModel, section: section, kind: kind, layoutEnvironment)
                height = size.heightDimension.dimension
             }
            
            return height
        }
        
        /// Set top insets for header view
        if let header = section.header {
            headerInsets = heightFor(viewModel: header, section: section, kind: UICollectionView.elementKindSectionHeader)
        }
        
        /// Set bottom insets for footer view
        if let footer = section.footer {
            footerInsets = heightFor(viewModel: footer, section: section, kind: UICollectionView.elementKindSectionFooter)
        }
        
        let sectionInsets = section.insets
        
        return NSDirectionalEdgeInsets(top: sectionInsets.top + headerInsets,
                                       leading: sectionInsets.left,
                                       bottom: sectionInsets.bottom + footerInsets,
                                       trailing: sectionInsets.right)
    }
}
