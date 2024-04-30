//
//  DSPageControlViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 12.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSPageControlVM: DSViewModel, Equatable, Hashable {
    
    public var currentPage: Int
    public var type: DSPageControlVMType
    public var galleryType: DSSectionGalleryType = .default
    
    @NonEquatable public var updatePage: ((Int) -> Void)?
    
    public init(type: DSPageControlVMType, galleryType: DSSectionGalleryType = .default, currentPage: Int = 0) {
        self.type = type
        self.galleryType = galleryType
        self.currentPage = currentPage
    }
    
    // View Model Height
    public var height: DSViewModelHeight = .estimated(30)
    
    // View model width
    public var width: DSViewModelWidth = .fractional(1.0)
    
    public var insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    public var identifier = "PageControl"
    public var accessibilityIdentifier = "PageControl"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    /// Companion object
    @NonEquatable public var object: AnyObject?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public extension DSPageControlVM {
    
    /// Get view model width
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width
    }
    
    /// Get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelHeight
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        
        if let height = type.getHeight(layoutEnvironment), let absoluteHeight = height.absolute() {
            return .absolute(absoluteHeight+38)
        }
        
        return height
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSPageControlUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    //    /// Scroll and pagination update
    //    /// - Returns: NSCollectionLayoutSectionVisibleItemsInvalidationHandler?
    //    func scrollHandler(didUpdate: @escaping () -> Void) -> NSCollectionLayoutSectionVisibleItemsInvalidationHandler? {
    //
//            return { [unowned self] items, position, environment in
//    
//                // optional: cancel task
//                updatePageTask?.cancel()
//    
//                updatePageTask = DispatchWorkItem {
//    
//                    guard let itemsWidth = items.first?.bounds.width else {
//                        return
//                    }
//    
//                    let page = Int((position.x + (itemsWidth / 2)) / itemsWidth)
//    
//                    if self.currentPage != page {
//                        self.currentPage = page
//                        DispatchQueue.main.now {
//                            didUpdate()
//                        }
//                    }
//                }
//    
//                guard let updatePageTask = updatePageTask else {
//                    return
//                }
//    
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: updatePageTask)
//            }
//        }
}

public enum DSPageControlVMType: Equatable, Hashable {
    
    
    public static func == (lhs: DSPageControlVMType, rhs: DSPageControlVMType) -> Bool {
        
        switch lhs {
        case .pages(let lpages):
            
            switch rhs {
            case .pages(let rpages):
                return lpages == rpages
            case .viewModels(_):
                return false
            }
            
        case .viewModels(let lmodels):
            
            switch rhs {
            case .pages(_):
                return false
            case .viewModels(let rmodels):
                return lmodels.isEqual(to: rmodels)
            }
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .pages(let pages):
            hasher.combine(pages)
        case .viewModels(let models):
            for model in models {
                hasher.combine(model.hash())
            }
        }
    }
    
    case viewModels([DSViewModel])
    case pages([DSPageVM])
    
    func getHeight(_ layoutEnvironment: NSCollectionLayoutEnvironment?) -> DSViewModelHeight? {
        
        switch self {
        case .pages(let pages):
            
            guard let first = pages.first else {
                return nil
            }
            
            return first.height
            
        case .viewModels(let models):
            
            guard let first = models.first else {
                return nil
            }
            
            return first.height(layoutEnvironment, section: DSSection())
        }
    }
}
