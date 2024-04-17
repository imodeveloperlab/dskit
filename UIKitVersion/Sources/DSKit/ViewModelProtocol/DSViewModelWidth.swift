//
//  DSViewModelHeight.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

public enum DSViewModelWidth: Equatable, Hashable {
    
    case absolute(CGFloat) // dimension with an absolute point value
    case estimated(CGFloat) //dimension is estimated with a point value. Actual size will be determined when the content is rendered.
    case fractional(CGFloat) //dimension is computed as a fraction of the width of the containing group
    
    public var rawValue: String {
        switch self {
        case .absolute(let height):
            return "DSViewModelWidthAbsolute_\(height)"
        case .estimated(let estimation):
            return "DSViewModelWidthEstimated_\(estimation)"
        case .fractional(let fraction):
            return "DSViewModelWidthFractional_\(fraction)"
        }
    }
}

extension DSViewModelWidth {
    
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
            return NSCollectionLayoutDimension.absolute(height)
        case .estimated(let estimated):
            return NSCollectionLayoutDimension.estimated(estimated)
        case .fractional(let fractional):
            return NSCollectionLayoutDimension.fractionalWidth(fractional)
        }
    }
}
