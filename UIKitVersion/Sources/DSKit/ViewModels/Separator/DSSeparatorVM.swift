//
//  DSSeparatorVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 18.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSSeparatorVM: DSViewModel, Equatable, Hashable {
       
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public init(type: DSSeparatorVMType = .default) {
        self.type = type
    }
    
    public var type: DSSeparatorVMType = .default
    public var identifier = "Separator"
    public var accessibilityIdentifier = "Separator"
        
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
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

public enum DSSeparatorVMType {
    case `default`
}

public extension DSSeparatorVM {
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return .absolute(0.5)
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSSeparatorUIView.instanceFromNib()
    }
    
    func contentInsets() -> UIEdgeInsets {
        return .zero
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}
