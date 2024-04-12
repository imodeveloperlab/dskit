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
    
    public init(_ textFont: DSTextFontKey) {
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
}

public extension DSSize {
    static var smallIcon: DSSize {
        16
    }
    
    static var mediumIcon: DSSize {
        20
    }
    
    static func size(_ number: DSDimension) -> DSSize {
        DSSize(width: number, height: number)
    }
    
    static func font(_ textFont: DSTextFontKey) -> DSSize {
        DSSize(textFont)
    }
    
    static func size(width: DSDimension, height: DSDimension) -> DSSize {
        DSSize(width: width, height: height)
    }
    
    static let unspecified = DSSize(width: .none, height: .none)
    static let fillUpTheSpace = DSSize(width: .fillUpTheSpace, height: .fillUpTheSpace)
}
