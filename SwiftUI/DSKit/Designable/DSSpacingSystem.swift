//
//  DSDefaultSpacing.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public protocol DSSpacingProtocol {
    func value(for: DSSpace) -> CGFloat
}

public struct DSSpacingSystem: DSSpacingProtocol {
    
    public let spatialSystem: CGFloat
    
    public init(spatialSystem: CGFloat) {
        self.spatialSystem = spatialSystem
    }
    
    public func value(for space: DSSpace) -> CGFloat {
        switch space {
        case .small:
            spatialSystem.multiply(by: 0.5)
        case .regular:
            spatialSystem.multiply(by: 1.0)
        case .medium:
            spatialSystem.multiply(by: 2.0)
        case .custom(let number):
            number
        case .zero:
            0
        }
    }
}
