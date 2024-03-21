//
//  DSPriceDetails+Random.swift
//  DSKit
//
//  Created by Borinschi Ivan on 06.03.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSPriceView {
    
    static func random(min: Int = 80, max: Int = 100, discount: Bool = true) -> DSPriceView {
        
        if discount {
            
            switch Int.random(in: 0...2) {
            case 0:
                return DSPriceView(amount: Int.random(in: min...max).string(), currency: "$")
            case 1:
                return randomDiscount(min: min, max: max)
            case 2:
                return randomDiscountWithBadge(min: min, max: max)
            default:
                return randomDiscount(min: min, max: max)
            }
            
        } else {
            return DSPriceView(amount: Int.random(in: min...max).string(), currency: "$")
        }
    }
    
    static func randomDiscount(min: Int = 80, max: Int = 100) -> DSPriceView {
        
        let regularAmount = Int.random(in: min...max)
        let amount = Int.random(in: 1...regularAmount)
        
        return DSPriceView(amount: amount.string(), regularAmount: regularAmount.string(), currency: "$")
    }
    
    static func randomDiscountWithBadge(min: Int = 80, max: Int = 100) -> DSPriceView {
        
        let regularAmount = Int.random(in: min...max)
        let amount = Int.random(in: 1...regularAmount)
        let discount = regularAmount - amount
        
        return DSPriceView(amount: amount.string(), regularAmount: regularAmount.string(), currency: "$", discountBadge: "-\(discount)$")
    }
}
