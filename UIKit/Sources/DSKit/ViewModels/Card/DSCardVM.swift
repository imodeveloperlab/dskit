//
//  DSCardVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 29.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

public struct DSCardVM: DSViewModel, Equatable, Hashable {
    
    public enum DSCardTextPosition {
        case top
        case bottom
        case center
    }
    
    // Properties
    public let composer: DSTextComposer
    public let textPosition: DSCardTextPosition
    public let backgroundImage: DSImageContent?
    
    public var gradientTopPosition: NSNumber = 0.0
    public var gradientBottomPosition: NSNumber = 1.0
    
    public var gradientTopColor: UIColor = .clear
    public var gradientBottomColor: UIColor = .clear
    public var decorationImage: UIImage? = nil
    public var height: DSViewModelHeight?
    public var width: DSViewModelWidth?
    
    public init(composer: DSTextComposer,
                textPosition: DSCardTextPosition = .bottom,
                backgroundImage: DSImageContent? = nil) {
        
        self.composer = composer
        self.textPosition = textPosition
        self.backgroundImage = backgroundImage
    }
    
    public var insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    public var type: DSLoyaltyCardVMType = .default
    public var identifier = "Card"
    public var accessibilityIdentifier = "Card"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle(displayStyle: .grouped(inSection: false))
    
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
    
    /// Companion object
    @NonEquatable public var object: AnyObject?
}

public enum DSLoyaltyCardVMType {
    case `default`
}

public extension DSCardVM {
    
    // Reusable identifier
    func reuseIdentifier() -> String {
        return hash()
    }
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return height ?? .absolute(200)
    }
    
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        return width ?? .fractional(1.0)
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSCardUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
