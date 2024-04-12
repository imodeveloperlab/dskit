//
//  DSDimension.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public enum DSDimension: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Equatable {
    
    case font(DSTextFont)
    case custom(CGFloat)
    case fillUpTheSpace
    case none
    case zero
    
    public init(floatLiteral value: FloatLiteralType) {
        self = .custom(CGFloat(value))
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        self = .custom(CGFloat(value))
    }
}

extension DSDimension {
    public func value(appearance: DSAppearance) -> CGFloat {
        switch self {
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
