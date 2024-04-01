//
//  DSTextfieldValidator.swift
//  DSKit
//
//  Created by Ivan Borinschi on 29.12.2022.
//

import Foundation

struct DSTextfieldValidator {
    static func isValidMinimLength(_ length: Int, _ text: String?) -> Bool {
        return text?.count ?? 0 >= length
    }
    
    static func isValidMaximLength(_ length: Int, _ text: String?) -> Bool {
        return text?.count ?? 0 <= length
    }
    
    static func validate(string: String?, pattern: String) -> Bool {
        guard !pattern.isEmpty else { return true }
        guard let string = string else { return false }
        
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            return regex.numberOfMatches(in: string, range: NSRange(location: 0, length: string.utf16.count)) > 0
        } catch {
            // Handle error or simply return false if the regex couldn't be created
            print("Invalid regex: \(error.localizedDescription)")
            return false
        }
    }
    
    static func isValidWhiteSpaces(string: String?) -> Bool {
        guard let string = string else { return false }
        return string.trimmingCharacters(in: .whitespacesAndNewlines).count > 0
    }
}

