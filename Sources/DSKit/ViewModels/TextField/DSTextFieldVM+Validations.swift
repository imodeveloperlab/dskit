//
//  DSTextFieldVM+Validations.swift
//  DSKit
//
//  Created by Borinschi Ivan on 04.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension DSTextFieldVM {
    
    /// Is text valid
    /// - Parameters:
    ///   - text: Text to validate
    ///   - validateEmptyTextField: Should result be valid is textfield is empty
    ///   - validate: validation result closure
    func isValid(text: String?, validateEmptyTextField: Bool,_ validate: @escaping (Bool) -> Void) {
        
        // We will use user defined validation
        if let userValidation = self.handleValidation {
            
            // Send current value to user validation
            validate(userValidation(text))
            
        } else {
            
            // If text is empty and validateEmptyTextField == true
            // then validate true
            if text == "" && validateEmptyTextField {
                validate(true)
                
            } else if validator.isValidMinimLength(validateMinimumLength, text) &&
                        validator.isValidMaximLength(validateMaximumLength, text) &&
                        validator.validate(string: text, pattern: validationPattern) &&
                        validator.isValidWhiteSpaces(string: text) {
                
                validate(true)
                
            } else {
                validate(false)
            }
        }
    }
}
