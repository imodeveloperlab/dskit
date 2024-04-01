//
//  DSSize.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public struct DSSize: Equatable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public let width: DSDimension
    public let height: DSDimension
    
    public init(width: DSDimension, height: DSDimension) {
        self.width = width
        self.height = height
    }
    
    public init(floatLiteral value: FloatLiteralType) {
        self.width = .custom(CGFloat(value))
        self.height = .custom(CGFloat(value))
    }
    
    public init(integerLiteral value: IntegerLiteralType) {
        self.width = .custom(CGFloat(value))
        self.height = .custom(CGFloat(value))
    }
    
    public static func size(_ number: DSDimension) -> DSSize {
        DSSize(width: number, height: number)
    }
    
    public static func size(width: DSDimension, height: DSDimension) -> DSSize {
        DSSize(width: width, height: height)
    }
    
    public static let smaller = DSSize(width: .small, height: .small)
    public static let small = DSSize(width: .regular, height: .regular)
    public static let regular = DSSize(width: .medium, height: .medium)
    public static let unspecified = DSSize(width: .none, height: .none)
    public static let medium = DSSize(width: .large, height: .large)
    public static let fillUpTheSpace = DSSize(width: .fillUpTheSpace, height: .fillUpTheSpace)
}
