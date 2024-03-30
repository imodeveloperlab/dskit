//
//  DSDefaultDesignableSize.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public struct DSDefaultDesignableSize: DSDesignableSize {
    
    public let spatialSystem: CGFloat
    
    public init(spatialSystem: CGFloat) {
        self.spatialSystem = spatialSystem
    }
    
    public func number(for space: DSSpacingDimension) -> CGFloat {
        switch space {
        case .small:
            spatialSystem.multiply(by: 0.5)
        case .regular:
            spatialSystem.multiply(by: 1.0)
        case .medium:
            spatialSystem.multiply(by: 2.0)
        case .large:
            spatialSystem.multiply(by: 2.5)
        case .mediumLarge:
            spatialSystem.multiply(by: 3.0)
        case .largexxxxx:
            spatialSystem.multiply(by: 4.0)
        case .extraLarge:
            spatialSystem.multiply(by: 5.0)
        case .larger:
            spatialSystem.multiply(by: 6.0)
        case .largest:
            spatialSystem.multiply(by: 7.0)
        case .custom(let number):
            number
        case .designSize(multiplier: let multiplier):
            spatialSystem.multiply(by: multiplier)
        case .fillUpTheSpace:
                .infinity
        case .none:
                .infinity
        case .zero:
            0
        }
    }
}
