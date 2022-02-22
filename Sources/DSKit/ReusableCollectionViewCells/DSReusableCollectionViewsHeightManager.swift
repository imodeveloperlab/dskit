//
//  DSReusableCollectionViewsHeightManager.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Used to store and read view models heigh
class DSReusableCollectionViewsHeightManager {
    
    // Stored heights
    private var heightDictionary: [String: CGFloat] = [:]
    private var widthDictionary: [String: CGFloat] = [:]
    
    // Shared
    static let shared = DSReusableCollectionViewsHeightManager()
    
    public init() {
    }
    
    /// Get height for view model if exist
    /// - Parameter viewModel: DSViewModel
    /// - Parameter section: DSSection
    /// - Returns: CGFloat?
    func heightFor(viewModel: DSViewModel, in section: DSSection) -> CGFloat? {
        return heightDictionary[heightKey(for: viewModel, in: section)]
    }
    
    /// Set height for view model
    /// - Parameters:
    ///   - height: height: CGFloat
    ///   - viewModel: DSViewModel
    ///   - section: DSSection
    func setFor(height: CGFloat, viewModel: DSViewModel, in section: DSSection) {
        return heightDictionary[heightKey(for: viewModel, in: section)] = height
    }
    
    /// Get view model height key
    /// - Parameter viewModel: viewModel
    /// - Returns: Key
    private func heightKey(for viewModel: DSViewModel, in section: DSSection) -> String {
        
        let insetsHash = viewModel.style.displayStyle.viewInsets().stringHash()
        
        var hasher = Hasher()
        hasher.combine("Height")
        hasher.combine(viewModel.hash())
        hasher.combine(section.type.hashValue)
        hasher.combine(insetsHash)        
        return hasher.finalize().string()
    }
    
    /// Get width for view model if exist
    /// - Parameter viewModel: DSViewModel
    /// - Parameter section: DSSection
    /// - Returns: CGFloat?
    func widthFor(viewModel: DSViewModel, in section: DSSection) -> CGFloat? {
        return heightDictionary[widthKey(for: viewModel, in: section)]
    }
    
    /// Set width for view model
    /// - Parameters:
    ///   - height: height: CGFloat
    ///   - viewModel: DSViewModel
    ///   - section: DSSection
    func setFor(width: CGFloat, viewModel: DSViewModel, in section: DSSection) {
        return widthDictionary[widthKey(for: viewModel, in: section)] = width
    }
    
    /// Get view model height key
    /// - Parameter viewModel: viewModel
    /// - Returns: Key
    private func widthKey(for viewModel: DSViewModel, in section: DSSection) -> String {
        
        let insetsHash = viewModel.style.displayStyle.viewInsets().stringHash()
        
        var hasher = Hasher()
        hasher.combine("Width")
        hasher.combine(viewModel.hash())
        hasher.combine(section.type.hashValue)
        hasher.combine(insetsHash)
        return hasher.finalize().string()
    }
}
