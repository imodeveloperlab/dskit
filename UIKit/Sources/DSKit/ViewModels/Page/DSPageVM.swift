//
//  DSWalkthroughPageViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//
//

import UIKit

public struct DSPageVM: DSViewModel, Equatable, Hashable {
    
    // View models to display in this page
    let viewModels: [DSViewModel]
    
    // Content insets, apply additional insets
    public var contentInsets: UIEdgeInsets = .zero
    
    // Page height
    public var height: DSViewModelHeight = .fractional(1.0)
    
    /// Init page with view models
    /// - Parameters:
    ///   - viewModels: Array of view models
    ///   - contentInsets: Content insets, default is .zero
    public init(viewModels: [DSViewModel], contentInsets: UIEdgeInsets = .zero) {
        self.viewModels = viewModels
    }
    
    // Type
    public var type: DSPageVMType = .default
    
    // Unique identifier, automate generated identifier will be assigned if this identifier is not unique
    public var identifier = "Page"
    
    // Accessibility identifier
    public var accessibilityIdentifier = "Page"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    // Handle did tap on this view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Companion object
    @NonEquatable public var object: AnyObject?
    
    // Equatable
    public static func == (lhs: DSPageVM, rhs: DSPageVM) -> Bool {
        return false
    }
    
    // Hashable
    public func hash(into hasher: inout Hasher) {
        for model in viewModels {
            hasher.combine(model.hash())
        }
    }
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public enum DSPageVMType {
    case `default`
}

public extension DSPageVM {
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSPageUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
