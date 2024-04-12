//
//  PasswordValidator.swift
//  DSKit
//
//  Created by Borinschi Ivan on 9/21/20.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import Foundation
import UIKit

public struct PasswordRule {
    let test: (String) -> Bool
}

public final class PasswordValidator {
    
    let rules: [PasswordRule] = [
        
        PasswordRule(test: { $0.count > 7 }),
        PasswordRule(test: { $0.satisfiesRegexp("[a-z]") }),
        PasswordRule(test: { $0.satisfiesRegexp("[0-9]") }),
        PasswordRule(test: { $0.satisfiesRegexp("[A-Z]") }),
        PasswordRule(test: { $0.satisfiesRegexp("[!@#$&()\\-`.+,/\"]*$]") })
    ]
    
    public func strengthForPassword(_ password: String) -> Double {
        return rules.reduce(0) { $0 + ($1.test(password) ? 1 : 0) }
    }
    
    public func colorForPassword(_ password: String) -> UIColor {
        
        return colorsForStrengths()[strengthForPassword(password)]!
    }
    
    public func colorsForStrengths() -> [Double: UIColor] {
        return [
            0: UIColor(0xD73B00),
            1: UIColor(0xC89100),
            2: UIColor(0xAEAE00),
            3: UIColor(0x97B73E),
            4: UIColor(0x21AF46)
        ]
    }
}

internal extension String {
    func satisfiesRegexp(_ regexp: String) -> Bool {
        return range(of: regexp, options: .regularExpression) != nil
    }
}
