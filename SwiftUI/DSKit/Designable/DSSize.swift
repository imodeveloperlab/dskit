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
    
    public static func designSize(_ number: CGFloat) -> DSSize {
        DSSize(width: .designSize(number), height: .designSize(number))
    }
    
    public static let smaller = DSSize(width: .small, height: .small)
    public static let small = DSSize(width: .regular, height: .regular)
    public static let regular = DSSize(width: .regularMedium, height: .regularMedium)
    public static let unspecified = DSSize(width: .none, height: .none)
    public static let medium = DSSize(width: .medium, height: .medium)
    public static let mediumLarge = DSSize(width: .mediumLarge, height: .mediumLarge)
    public static let large = DSSize(width: .large, height: .large)
    public static let extraLarge = DSSize(width: .extraLarge, height: .extraLarge)
    public static let larger = DSSize(width: .larger, height: .larger)
    public static let largest = DSSize(width: .largest, height: .largest)
    public static let fillUpTheSpace = DSSize(width: .fillUpTheSpace, height: .fillUpTheSpace)
}
