//
//  String+Amount.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension String {
    
    func isValidAsAmount() -> Bool {
        
        var numericCharset = CharacterSet.decimalDigits
        let decimalSeparator: String = NumberFormatter().decimalSeparator
        let groupSeparator: String = NumberFormatter().groupingSeparator
        
        numericCharset.insert(charactersIn: decimalSeparator)
        numericCharset.insert(charactersIn: groupSeparator)
        
        let nonNumericCharset: CharacterSet = numericCharset.inverted
        let nonNumericRange: NSRange = (self as NSString).rangeOfCharacter(from: nonNumericCharset)
        
        if nonNumericRange.location != NSNotFound {
            return false
        }
        
        let numericParts: [String] = self.components(separatedBy: decimalSeparator)
        
        if numericParts.count > 2 {
            return false
        }
        
        if numericParts.count == 2 && numericParts[1].count > 3 {
            return false
        }
        
        return true
    }
    
    func doubleStringToCents() -> Int? {
        
        if let initialValue = Decimal(string: self), let multiplier = Decimal(string: "100") {
            let finalValue = initialValue * multiplier
            let result = NSDecimalNumber(decimal: finalValue)
            return Int(truncating: result)
        }
        
        return nil
    }
    
    func toInt() -> Int {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let number = formatter.number(from: self) else {
            return 0
        }
        return number.intValue
    }
    
    func toNumber() -> NSNumber {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        
        guard let number = formatter.number(from: self) else {
            return NSNumber(value: 0)
        }
        
        return number
    }
    
}
