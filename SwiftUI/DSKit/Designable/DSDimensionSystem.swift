//
//  DSDimension.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public protocol DSDimensionProtocol {
    func value(for: DSDimension, appearance: DSAppearance) -> CGFloat
}


public struct DSDimensionSystem: DSDimensionProtocol {
    
    public let spatialSystem: CGFloat
    
    public init(spatialSystem: CGFloat) {
        self.spatialSystem = spatialSystem
    }
    
    public func value(for dimension: DSDimension, appearance: DSAppearance) -> CGFloat {
        switch dimension {
        case .custom(let number):
            number
        case .fillUpTheSpace:
                .infinity
        case .none:
                .infinity
        case .zero:
            0
        case .font(let font):
            font.pointSize(for: appearance)
        }
    }
}
