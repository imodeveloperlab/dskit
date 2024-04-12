//
//  DSPrice.swift
//  DSKit
//
//  Created by Ivan Borinschi on 29.02.2023.
//

import Foundation

public struct DSPrice {
    let amount: String
    let regularAmount: String?
    let currency: String
    var discountBadge: String?
    
    public init(amount: String, regularAmount: String? = nil, currency: String, discountBadge: String? = nil) {
        self.amount = amount
        self.regularAmount = regularAmount
        self.currency = currency
        self.discountBadge = discountBadge
    }
}
