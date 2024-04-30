//
//  DSViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model protocol, that describes how each view model should behave
/// in order to be displayed on the screen
public protocol DSViewModel {
    
    /// Get DSReusableUIView representation for current `DSViewModel`
    func viewRepresentation() -> DSReusableUIView
    
    /// Uniq view model identifier
    /// Can be specified individually for each view model
    /// `If` identifiers are not `uniq` then DSKit will automatically generate an uniq identifier for each view model
    var identifier: String {get set}
    
    /// Accessibility Identifier
    /// Used for UI Tests, to identify each view model on the screen
    var accessibilityIdentifier: String {get set}
    
    /// Style
    var style: DSViewModelStyle {get set}
    
    /// Return view colors for current view model
    /// Used to get different representation for view model based on `displayStyle: DSViewModelDisplayStyle`
    func viewColors(mirrored: Bool) -> DSDesignableViewColors
    
    /// Calculate and get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight
    
    /// Calculate and get view model width
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth
    
    /// Check if current view model is equal to other view model
    /// Used by `DSViewModelDataSource` to determine the changes between `new` and `old` content
    /// - Parameter object: View Model to compare
    func isEqual(to object: DSViewModel) -> Bool
    
    /// Return view model reusable identifier
    /// Each view model `VIEW` should have unique identifier to be reused
    /// By default  is`return String(describing: type(of: self)) + displayStyle.rawValue`
    func reuseIdentifier() -> String
    
    /// Get view model hash
    func hash() -> String
    
    /// Handle did tap on a view on screen
    var didTap: ((DSViewModel) -> Void)? {get set}
    
    /// Supplementary items
    var supplementaryItems: [DSSupplementaryView]? {get set}
    
    /// Bottom side view
    var bottomSideView: DSSideView? { get set }
    
    /// Top side view
    var topSideView: DSSideView? { get set }
    
    /// Left side view
    var leftSideView: DSSideView? { get set }
    
    /// Right side view
    var rightSideView: DSSideView? { get set }
    
    /// Companion object
    var object: AnyObject? { get set }
}
