//
//  DSValidator.swift
//  MMUtils
//
//  Created by Borinschi Ivan on 1/9/20.
//  Copyright © 2020 Borinschi Ivan. All rights reserved.
//

import Foundation

public let patternNumbers = "^[0-9]*$"
public let patternLetters = "^[a-zA-Z]*$"
public let patternNameUmlaute = "^[\\ü\\ö\\ä\\Ä\\Ü\\Ö\\ß\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
public let patternName = "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
public let patternLettersAndSpaces = "^[\\u0600-\\u06FFa-zA-Z\\s]*$"
public let patternLettersAndNumbers = "^[a-zA-Z0-9]*$"
public let patternLettersNumbersAndSpaces = "^[\\u0600-\\u06FFa-zA-Z0-9\\s]*$"
public let patternAddressUmlaute = "^[\\ü\\ö\\ä\\Ä\\Ü\\Ö\\ß\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$"
public let patternAddress = "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$"
public let patternEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
public let patternPhoneNumber = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
public let patternPhoneNumber2 = "(\\+?( |-|\\.)?\\d{1,3}( |-|\\.)?)?(\\(?\\d{1,5}\\)?|\\d{1,5})( |-|\\.)?(\\d{1,4}( |-|\\.)?\\d{3,4})"
public let patternMin8Max20CharsAtLeastOneDigitAtLeastOneLetter = "^(?=.*\\d)((?=.*[a-z])|(?=.*[A-Z])).*$"
public let patternCityNameUmlaute = "^[\\ü\\ö\\ä\\Ä\\Ü\\Ö\\ß\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"
public let patternCityName = "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$"

public final class DSStringValidator {

    public init() {}
    
    /// Validate value
    /// - Parameters:
    ///   - value: String
    ///   - oldValue: String
    ///   - pattern: String
    /// - Returns: String
    public func validValue(value: String, oldValue: String, pattern: String) -> String {
        
        if (validate(string: value, pattern: pattern)) {
            return value
        } else {
            return oldValue
        }
    }
    
    /// Validate
    /// - Parameters:
    ///   - string: String?
    ///   - pattern: String
    /// - Returns: Bool
    public func validate(string: String?, pattern: String) -> Bool {
        
        guard let string = string else {
            return false
        }
        
        if pattern == "" {
            return true
        }
        
        if string.isEmpty {
            return true
        }
        
        if isValid(input: string, pattern: pattern) {
            return true
        }
        
        return false
    }
    
    /// Is valid
    /// - Parameters:
    ///   - input: String?
    ///   - pattern: String
    /// - Returns: Bool
    func isValid(input: String?, pattern: String) -> Bool {
        
        guard let input = input else {
            return false
        }
        
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: input)
    }
    
    /// Is valid minimum length
    /// - Parameters:
    ///   - minimLength: Int
    ///   - string: String?
    /// - Returns: Bool
    public func isValidMinimLength(_ minimLength: Int, _ string: String?) -> Bool {
        
        if let string = string {
            if string.count >= minimLength {
                return true
            }
        }
        return false
    }
    
    /// Is valid maximum length
    /// - Parameters:
    ///   - maximLength: Int
    ///   - string: String?
    /// - Returns: Bool
    public func isValidMaximLength(_ maximLength: Int, _ string: String?) -> Bool {
        
        if let string = string {
            if string.count <= maximLength {
                return true
            }
        }
        return false
    }
    
    /// Is valid white spaces
    /// - Parameter string: String?
    /// - Returns: Bool
    public func isValidWhiteSpaces(string: String?) -> Bool {
        
        if let string = string {
            
            if !string.isEmpty {
                
                if string.first! == " " {
                    return false
                }
                
//                if string.last! == " " {
//                    return false
//                }
                
                if string.contains("  ") {
                    return false
                }
            }
        }
        
        return true
    }
}
