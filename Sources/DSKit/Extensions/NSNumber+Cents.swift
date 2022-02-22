//
//  NSNumberExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 5/23/20.
//  Copyright © 2020 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension NSNumber {
    
    func stringFormatted(withNumberOfDecimals numberOfDecimals: Int) -> String {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = numberOfDecimals
        formatter.minimumFractionDigits = numberOfDecimals
        
        guard let finalValue = formatter.string(from: self) else {
            return "0.00"
        }
        
        return finalValue
    }
    
    func stringFormattedAmount() -> String {
       return stringFormatted(withNumberOfDecimals: 2)
    }
    
    func toCents() -> NSNumber {
        return NSNumber(value: lround(self.doubleValue * 100))
    }
    
    func fromCents() -> NSNumber {
        return NSNumber(value: self.doubleValue / 100)
    }
    
    class func divideFloat(first: Float, second: Float) -> Float {
        
        if first == 0 || second == 0 {
            return Float(0)
        }
        
        let result = first/second
        
        if result > 0 {
            return Float(result)
        } else {
            return Float(0)
        }
    }
}
