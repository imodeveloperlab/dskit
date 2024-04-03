//
//  CurrencyColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public protocol DSPriceAppearanceProtocol {
    var currency: UIColor { get set }
    var amount: UIColor { get set }
    var regularAmount: UIColor { get set }
    var badgeBackground: UIColor { get set }
    var badgeText: UIColor { get set }
    var badgeCornerRadius: CGFloat { get set }
}

public struct DSPriceAppearance: DSPriceAppearanceProtocol {
    
    public init(
        currency: UIColor, 
        amount: UIColor,
        regularAmount: UIColor,
        badgeBackground: UIColor = .red, 
        badgeText: UIColor = .white,
        badgeCornerRadius: CGFloat = 4.0
    ) {
        self.currency = currency
        self.amount = amount
        self.badgeText = badgeText
        self.badgeBackground = badgeBackground
        self.badgeCornerRadius = badgeCornerRadius
        self.regularAmount = regularAmount
    }
    
    public var currency: UIColor
    public var amount: UIColor
    public var regularAmount: UIColor
    public var badgeBackground: UIColor
    public var badgeText: UIColor
    public var badgeCornerRadius: CGFloat
}
