//
//  DSViewModelHeight.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model height
public enum DSViewModelHeight: Equatable, Hashable {
    
    case absolute(CGFloat) // dimension with an absolute point value
    case estimated(CGFloat) //dimension is estimated with a point value. Actual size will be determined when the content is rendered.
    case fractional(CGFloat) //dimension is computed as a fraction of the height of the containing group
    
    public var rawValue: String {
        switch self {
        case .absolute(let height):
            return "DSViewModelHeightAbsolute_\(height)"
        case .estimated(let estimation):
            return "DSViewModelHeightEstimated_\(estimation)"
        case .fractional(let fraction):
            return "DSViewModelHeightFractional_\(fraction)"
        }
    }
}

extension DSViewModelHeight {
    
    /// Is estimated
    public var isEstimated: Bool {
        
        switch self {
        case .estimated(_):
            return true
        default:
            return false
        }
    }
    
    /// Is absolute
    public var isAbsolute: Bool {
        switch self {
        case .absolute(_):
            return true
        default:
            return false
        }
    }
    
    /// Is fractional
    public var isFractional: Bool {
        switch self {
        case .fractional(_):
            return true
        default:
            return false
        }
    }
    
    // Absolute width
    func absolute() -> CGFloat? {
        switch self {
        case .absolute(let height):
            return height
        case .estimated(_):
            return nil
        case .fractional(_):
            return nil
        }
    }
    
    // Transform to NSCollectionLayoutDimension
    func dimension() -> NSCollectionLayoutDimension {
                
        switch self {
        case .absolute(let height):
            return NSCollectionLayoutDimension.absolute(height == 0 ? 1 : height)
        case .estimated(let estimated):
            return NSCollectionLayoutDimension.estimated(estimated)
        case .fractional(let fractional):
            return NSCollectionLayoutDimension.fractionalHeight(fractional)
        }
    }
}
