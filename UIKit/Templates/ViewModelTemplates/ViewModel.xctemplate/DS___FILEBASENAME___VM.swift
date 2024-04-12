//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import DSKit

public struct DS___VARIABLE_moduleName___VM: DSViewModel, Equatable, Hashable {
    
    // ADD YOUR PROPERTIES HERE
    
    // Properties
    public init() {
    }
    
    // View Model Height
    public var height: DSViewModelHeight = .absolute(100)
    
    // View model width
    public var width: DSViewModelWidth = .fractional(1.0)
        
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    /// Side views
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
    
    // View model type
    public var type: DS___VARIABLE_moduleName___VMType = .default
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "___VARIABLE_moduleName___"
    
    // Accessibility identifier
    public var accessibilityIdentifier = "___VARIABLE_moduleName___"
    
    // Handle did tap on this view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Companion object
    @NonEquatable public var object: AnyObject?
}

public enum DS___VARIABLE_moduleName___VMType {
    case `default`
}

public extension DS___VARIABLE_moduleName___VM {
    
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
        return DS___VARIABLE_moduleName___UIView.instanceFromNib()
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
