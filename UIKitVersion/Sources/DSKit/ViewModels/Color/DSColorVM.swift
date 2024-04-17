//
//  DSColorVM.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 18.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSColorVM: DSViewModel, Equatable, Hashable {
    
    public var color: UIColor?
    
    // Properties
    public init(color: UIColor) {
        self.color = color
    }
    
    // View Model Height
    public var height: DSViewModelHeight = .absolute(100)
    
    // View model width
    public var width: DSViewModelWidth = .fractional(1.0)
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
        
    // View model display style
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    /// Side views
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
    
    // View model type
    public var type: DSColorVMType = .default
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "Color"
    
    // Accessibility identifier
    public var accessibilityIdentifier = "Color"
    
    // Handle did tap on this view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Companion object
    @NonEquatable public var object: AnyObject?
}

public enum DSColorVMType {
    case `default`
}

public extension DSColorVM {
    
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
        return height
    }
    
    /// Get UIView representation
    /// - Returns: DSReusableUIView
    func viewRepresentation() -> DSReusableUIView {
        return DSColorUIView.instanceFromNib()
    }
    
    /// Is this view model equal to another
    /// - Parameter model: DSViewModel
    /// - Returns: Bool
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    /// View model hash
    func hash() -> String {
        return hashValue.string()
    }
}
