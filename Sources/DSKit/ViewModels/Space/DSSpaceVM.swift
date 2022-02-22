//
//  DSSpaceViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 18.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

// Add space between view models
public struct DSSpaceVM: DSViewModel, Equatable, Hashable {
       
    /// Init space type
    /// - Parameter type: DSSpaceVMType
    public init(type: DSSpaceVMType = .default) {
        self.type = type
    }
    
    /// Space type
    public var type: DSSpaceVMType = .default
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "Space"
    
    // Accessibility identifier
    public var accessibilityIdentifier = "Space"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    // Handle did tap on this view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
    
    /// Companion object
    @NonEquatable public var object: AnyObject?
}

/// Space type
public enum DSSpaceVMType: Equatable, Hashable {
    
    case `default` // will be used margin space
    case custom(CGFloat)
    
    /// Raw value
    var rawValue: String {
        switch self {
        case .default:
            return "Default"
        case .custom(let height):
            return "Custom\(height)"
        }
    }
}

public extension DSSpaceVM {
    
    /// Default reuse view identifier
    /// - Returns: Identifier
    func reuseIdentifier() -> String {
        return String(describing: Swift.type(of: self)) + style.displayStyle.rawValue + type.rawValue
    }
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        
        switch type {
        case .default:
            return .absolute(DSAppearance.shared.main.margins)
        case .custom(let space):
            return .absolute(space)
        }
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSSpaceUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
