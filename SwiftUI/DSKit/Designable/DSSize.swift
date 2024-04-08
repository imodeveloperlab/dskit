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
    
    public init(_ textFont: DSTextFont) {
        self.width = .font(textFont)
        self.height = .font(textFont)
    }
    
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
    
    public static func font(_ textFont: DSTextFont) -> DSSize {
        DSSize(textFont)
    }
    
    public static func size(width: DSDimension, height: DSDimension) -> DSSize {
        DSSize(width: width, height: height)
    }
    
    public static let unspecified = DSSize(width: .none, height: .none)
    public static let fillUpTheSpace = DSSize(width: .fillUpTheSpace, height: .fillUpTheSpace)
}
