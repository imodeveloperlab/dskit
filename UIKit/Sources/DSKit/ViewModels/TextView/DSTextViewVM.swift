//
//  DSTextViewVM.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 18.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class DSTextViewVM: DSViewModel, Equatable, Hashable {

    // Properties
    public var text: String?
    
    /// Init textfield with text and placeholder
    /// - Parameters:
    ///   - text: Optional String
    ///   - placeholder: String
    public init(text: String? = nil) {
        self.text = text
    }
    
    // Handle did update
    @NonEquatable public var didUpdate: ((DSTextViewVM) -> Void)?
    
    // View Model Height
    public var height: DSViewModelHeight = .absolute(100)
    
    // View model width
    public var width: DSViewModelWidth = .fractional(1.0)
        
    // View model display style
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    // View model type
    public var type: DSTextViewVMType = .default
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "TextView"
    
    // Accessibility identifier
    public var accessibilityIdentifier = "TextView"
    
    // Handle did tap on this view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Companion object
    @NonEquatable public var object: AnyObject?
    
    public static func == (lhs: DSTextViewVM, rhs: DSTextViewVM) -> Bool {
        return lhs.text == rhs.text &&
            lhs.accessibilityIdentifier == rhs.accessibilityIdentifier &&
            lhs.type == rhs.type &&
            lhs._didTap == rhs._didTap &&
            lhs._didUpdate == rhs._didUpdate
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(accessibilityIdentifier)
        hasher.combine(type)
    }
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public enum DSTextViewVMType {
    case `default`
}

public extension DSTextViewVM {
    
    // Reusable identifier
    func reuseIdentifier() -> String {
        return hash()
    }
    
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
    
    // View representation
    func viewRepresentation() -> DSReusableUIView {
        return DSTextViewUIView.instanceFromNib()
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
