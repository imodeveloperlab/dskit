//
//  AmountFormatter.swift
//  DSKit
//
//  Created by Borinschi Ivan on 5/23/20.
//  Copyright © 2020 Borinschi Ivan. All rights reserved.
//

import Foundation

open class AmountFormatter {
    
    var amountString: String
    var numberOfDecimals: Int
    
    static func stringFormatted(amount: Int) -> String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        let finalValue: String? = formatter.string(from: NSNumber(value: amount))
        return finalValue!
    }
    
    public init() {
        self.amountString = AmountFormatter.stringFormatted(amount: 0)
        self.numberOfDecimals = 2
    }
    
    // To add 3 to 34.56 :
    // 1. Add 3 to the end - 34.563
    // 2. Shift dot to right - 345.63
    public func addDigit(_ digit: Int) {
        let digitString: String = "\(digit)"
        amountString += (digitString)
        shiftDotRight()
    }
    
    // To remove last digit from 34.56 :
    // 1. Remove last digit - 34.5
    // 2. Shift dot to left - 3.45
    public func removeDigit() {
        let tmpAmount = amountString as NSString
        amountString = tmpAmount.substring(to: tmpAmount.length - 1)
        shiftDotLeft()
    }
    
    // Shift dot to right. E.g. 0.001:
    // 1. Shift dot to right - 00.01
    // 2. Delete unnecessary zero at the beginning. - 0.01
    public func shiftDotRight() {
        // 1. Shift dot to right
        let tmpAmount = NSMutableString(string: amountString)
        let dotRange: NSRange = (tmpAmount as NSString).range(of: ".")
        tmpAmount.deleteCharacters(in: dotRange)
        tmpAmount.insert(".", at: dotRange.location + 1)
        
        // 2. Remove unnecessary zero at the beginning
        if tmpAmount.hasPrefix("0") {
            tmpAmount.deleteCharacters(in: NSRange(location: 0, length: 1))
        }
        
        amountString = tmpAmount as String
    }
    
    // Shift dot to left. E.g. 1.3
    // 1. Shift dot to left .13
    // 2. Add lead 0 if need - 0.13
    public func shiftDotLeft() {
        // 1. Shift dot to left
        let tmpAmount = NSMutableString(string: amountString)
        let dotRange: NSRange = (tmpAmount as NSString).range(of: ".")
        tmpAmount.deleteCharacters(in: dotRange)
        tmpAmount.insert(".", at: dotRange.location - 1)
        
        // 2. Add lead zero if need
        if (tmpAmount as NSString).range(of: ".").location == 0 {
            tmpAmount.insert("0", at: 0)
        }
        
        amountString = tmpAmount as String
    }
    
    public func formattedAmount() -> String {
        
        guard let doubleAmount = Double(amountString) else {
            return "0,00"
        }
        
        let number = NSNumber(value: doubleAmount)
        return number.stringFormatted(withNumberOfDecimals: self.numberOfDecimals)
    }
    
    public func intAmount() -> Int {
        var tmpAmount = amountString.replacingOccurrences(of: ".", with: "")
        tmpAmount = tmpAmount.replacingOccurrences(of: ",", with: "")
        return tmpAmount.toInt()
    }
    
    public func amount() -> Int {
        return self.intAmount()
    }
    
}
