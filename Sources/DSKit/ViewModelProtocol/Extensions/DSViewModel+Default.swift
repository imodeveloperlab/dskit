//
//  DSViewModel+DefaultProtocolImplementation.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Default implementation for `DSViewModel` protocol
public extension DSViewModel {
    
    /// Default reuse view identifier
    /// - Returns: Identifier
    func reuseIdentifier() -> String {
        
        var additionalIdentifier = ""
        
        if let supplementaryItems = supplementaryItems {
            for item in supplementaryItems {
                additionalIdentifier += item.view.reuseIdentifier()
            }
        }
        
        return String(describing: type(of: self)) + style.displayStyle.rawValue + additionalIdentifier
    }
    
    /// Default hash will be `reuseIdentifier()`
    func hash() -> String {
        return reuseIdentifier()
    }
    
    /// Default width
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelWidth
    func width(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelWidth {
        
        switch section.type {
        case .grid(columns: let columns):
            return .fractional(1.0 / CGFloat(columns))
        case .list:
            return .fractional(1.0)
        case .gallery(type: let type):            
            switch type {
            case .default:
                return .fractional(1.0)
            case .fullWidth:
                return .fractional(1.0)
            }
        }
    }
    
    /// Default view representation
    /// - Returns: DSReusableUIView
    func viewRepresentation() -> DSReusableUIView {
        return DefaultReusableUIViewView()
    }
}
