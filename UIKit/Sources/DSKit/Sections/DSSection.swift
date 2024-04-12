//
//  DSSection.swift
//  DSKit
//
//  Created by Borinschi Ivan on 10.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// This class is used to describe sections in DSViewController
public class DSSection: Equatable, Hashable {
    
    /// View models displayed in this section
    public var viewModels: [DSViewModel] = [DSViewModel]()
    
    /// Header view
    public var header: DSViewModel? {
        didSet {
            
            if header != nil {
                self.insets.top = DSAppearance.shared.main.interItemSpacing
            } else {
                self.insets.top = DSAppearance.shared.main.margins
            }
        }
    }
    
    /// Footer View
    public var footer: DSViewModel? {
        didSet {
            
            if footer != nil {
                self.insets.bottom = DSAppearance.shared.main.interItemSpacing
            } else {
                self.insets.bottom = DSAppearance.shared.main.margins
            }
        }
    }
    
    /// Scroll handler
    public var scrollHandler: NSCollectionLayoutSectionVisibleItemsInvalidationHandler?
    
    public func getScrollHandler(for collectionView: DSCollectionView) -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler? {
            return scrollHandler
    }
    
    /// Section insets
    public var insets: UIEdgeInsets = .zero
    
    /// Grouped background
    public var background: DSSectionBackgroundType = .`default`
    
    /// Inter items spacing
    public var interItemSpacing: CGFloat = 0
    
    /// DSSection type
    public var type: DSSectionType = .list
    
    /// Section unique identifier
    public var identifier: String?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(header?.hash())
        hasher.combine(footer?.hash())
    }
    
    public static func == (lhs: DSSection, rhs: DSSection) -> Bool {
        return
            lhs.insets == rhs.insets &&
            lhs.type == rhs.type &&
            lhs.interItemSpacing == rhs.interItemSpacing
    }
    
    init() {
        
        
    }
}
