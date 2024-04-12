//
//  DSPadding.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public enum DSPadding: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Equatable {
    case small
    case regular
    case medium
    case large
    case custom(CGFloat)
    case zero
    
    public init(floatLiteral value: FloatLiteralType) {
        self = .custom(CGFloat(value))
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        self = .custom(CGFloat(value))
    }
}
