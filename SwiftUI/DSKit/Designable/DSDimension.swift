//
//  DSDimension.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public enum DSDimension: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Equatable {
    case small
    case regular
    case regularMedium
    case medium
    case mediumLarge
    case large
    case extraLarge
    case larger
    case largest
    case custom(CGFloat)
    case fillUpTheSpace
    case designSize(CGFloat)
    case none
    case zero
    
    public init(floatLiteral value: FloatLiteralType) {
        self = .custom(CGFloat(value))
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        self = .custom(CGFloat(value))
    }
}
