//
//  DSQuantityPickerVM.swift
//  DSKit Explorer
//
//  Created by Borinschi Ivan on 15.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public class DSQuantityPickerVM: DSViewModel, Equatable, Hashable {
    
    public var quantity: Int = 1
    public var quantityPluralText: String?
    public var quantitySingularText: String?
    
    // Properties
    public init(quantity: Int = 1) {
        self.quantity = quantity
    }
    
    // View model right view
    var rightView: DSView?
    
    // View model left view
    var leftView: DSView?
    
    // View Model Height
    public var height: DSViewModelHeight = .absolute(50)
    
    // View model width
    public var width: DSViewModelWidth = .fractional(1.0)
    
    // Quantity text type
    public var quantityTextType: DSTextType = .headline
        
    // View model display style
    
    // View model type
    public var type: DSQuantityPickerVMType = .default
    
    // Unique identifier, if identifier will not be uniq DSKit will generate one for you
    // but this may affect content diff animations
    public var identifier = "QuantityPicker"
    
    // Accessibility identifier
    public var accessibilityIdentifier = "QuantityPicker"
    
    // Handle did tap on this view model
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Handle did tap on this view model
    @NonEquatable public var quantityDidUpdate: ((Int) -> Void)?
    
    // Handle did tap on this view model
    @NonEquatable public var quantityDidIncrease: ((Int) -> Void)?
    
    // Handle did tap on this view model
    @NonEquatable public var quantityDidDecrease: ((Int) -> Void)?
    
    // Companion object
    @NonEquatable public var object: AnyObject?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle()
    
    public static func == (lhs: DSQuantityPickerVM, rhs: DSQuantityPickerVM) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.accessibilityIdentifier == rhs.accessibilityIdentifier &&
        lhs.quantity == rhs.quantity &&
        lhs.type == rhs.type &&
        lhs.leftView == rhs.leftView &&
        lhs.rightView == rhs.rightView
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
        hasher.combine(quantity)
        hasher.combine(accessibilityIdentifier)
        hasher.combine(type)
        hasher.combine(leftView)
        hasher.combine(rightView)
    }
}

public enum DSQuantityPickerVMType {
    case `default`
}

public extension DSQuantityPickerVM {
    
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
        return DSQuantityPickerUIView.instanceFromNib()
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
