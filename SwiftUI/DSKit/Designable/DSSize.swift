//
//  DSSize.swift
//  DSKit
//
//  Created by Ivan Borinschi on 26.02.2023.
//

import Foundation

public struct DSSize: Equatable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public let width: DSSpacingDimension
    public let height: DSSpacingDimension
    
    public init(width: DSSpacingDimension, height: DSSpacingDimension) {
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
    
    public static func size(_ number: DSSpacingDimension) -> DSSize {
        DSSize(width: number, height: number)
    }
    
    public static func size(width: DSSpacingDimension, height: DSSpacingDimension) -> DSSize {
        DSSize(width: width, height: height)
    }
    
    public static func designSize(_ number: CGFloat) -> DSSize {
        DSSize(width: .designSize(number), height: .designSize(number))
    }
    
    public static let smaller = DSSize(width: .small, height: .small)
    public static let small = DSSize(width: .regular, height: .regular)
    public static let regular = DSSize(width: .medium, height: .medium)
    public static let unspecified = DSSize(width: .none, height: .none)
    public static let medium = DSSize(width: .large, height: .large)
    public static let mediumLarge = DSSize(width: .mediumLarge, height: .mediumLarge)
    public static let large = DSSize(width: .largexxxxx, height: .largexxxxx)
    public static let extraLarge = DSSize(width: .extraLarge, height: .extraLarge)
    public static let larger = DSSize(width: .larger, height: .larger)
    public static let largest = DSSize(width: .largest, height: .largest)
    public static let fillUpTheSpace = DSSize(width: .fillUpTheSpace, height: .fillUpTheSpace)
}
