//
//  CurrencyColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Price colors
public struct DSDesignablePriceColor: Equatable, Hashable {
    
    /// Init price colors
    /// - Parameters:
    ///   - currency: UIColor
    ///   - amount: UIColor
    public init(currency: UIColor, amount: UIColor, regularAmount: UIColor, badgeBackground: UIColor = .red, badgeText: UIColor = .white, badgeCornerRadius: CGFloat = 4.0) {
        self.currency = currency
        self.amount = amount
        self.badgeText = badgeText
        self.badgeBackground = badgeBackground
        self.badgeCornerRadius = badgeCornerRadius
        self.regularAmount = regularAmount
    }
    
    /// Currency color
    var currency: UIColor
    
    /// Amount color
    var amount: UIColor
    
    /// Regular amount color
    var regularAmount: UIColor
    
    /// Badge background color
    var badgeBackground: UIColor
    
    /// Badge text color
    var badgeText: UIColor
    
    /// Badge corner radius
    var badgeCornerRadius: CGFloat
}
