//
//  DSTextField+Factory.swift
//  DSKit
//
//  Created by Ivan Borinschi on 29.12.2022.
//

import SwiftUI

public extension DSTextField {
    // Email TextField
    static func email(value: DSTextFieldValue, placeholder: String = "Email") -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .emailAddress,
            textContentType: .emailAddress,
            autocapitalizationType: .none,
            validationPattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}",
            keftSystemName: "envelope.fill",
            validateMinimumLength: 5,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }
    
    /// Generates a phone number input field.
    ///
    /// This function creates a `DSTextField` for entering phone numbers. It allows for a custom validation pattern,
    /// but defaults to a standard phone number pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text, defaults to "Phone".
    ///   - customValidationPattern: Optional custom pattern for validation.
    /// - Returns: A `DSTextField` configured for phone number input.
    static func phone(value: DSTextFieldValue,
                      placeholder: String = "Phone",
                      customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .phonePad,
            textContentType: .telephoneNumber,
            autocapitalizationType: .none,
            validationPattern: customValidationPattern ?? "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$",
            keftSystemName: "phone.fill",
            validateMinimumLength: 5,
            validateMaximumLength: 35,
            validateEmptyTextField: false
        )
    }

    /// Creates a secure code input field.
    ///
    /// Generates a `DSTextField` for entering secure codes. By default, it uses a letters and numbers pattern for validation,
    /// but allows for a custom pattern if provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text, defaults to the provided value.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to letters and numbers pattern.
    /// - Returns: A `DSTextField` configured for secure code entry.
    static func secureCode(value: DSTextFieldValue,
                           placeholder: String = "Secure Code",
                           customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: true,
            keyboardType: .phonePad,
            textContentType: .oneTimeCode,
            autocapitalizationType: .none,
            validationPattern: customValidationPattern ?? "^[a-zA-Z0-9]*$",
            keftSystemName: "lock",
            validateMinimumLength: 4,
            validateMaximumLength: 10,
            validateEmptyTextField: false
        )
    }

    /// Creates a password input field.
    ///
    /// Generates a `DSTextField` for password entry. It allows for a custom validation pattern,
    /// but if none is provided, a default pattern suitable for passwords will be used.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text, defaults to the provided value.
    ///   - customValidationPattern: Optional custom pattern for validation.
    /// - Returns: A `DSTextField` configured for password entry.
    static func password(value: DSTextFieldValue,
                         placeholder: String = "Password",
                         customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: true,
            keyboardType: .default,
            textContentType: .password,
            autocapitalizationType: .none,
            validationPattern: customValidationPattern ?? "",
            keftSystemName: "lock.fill",
            validateMinimumLength: 8,
            validateMaximumLength: 14,
            validateEmptyTextField: false
        )
    }
    
    /// Creates a new password input field.
    ///
    /// Generates a `DSTextField` specifically for new password entry. It supports a custom validation pattern,
    /// but defaults to a basic pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text, defaults to the provided value.
    ///   - customValidationPattern: Optional custom pattern for validation.
    /// - Returns: A `DSTextField` configured for new password entry.
    static func newPassword(value: DSTextFieldValue,
                            placeholder: String = "New Password",
                            customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: true,
            keyboardType: .default,
            textContentType: .newPassword,
            autocapitalizationType: .none,
            validationPattern: customValidationPattern ?? "",
            keftSystemName: "lock.fill",
            validateMinimumLength: 8,
            validateMaximumLength: 14,
            validateEmptyTextField: false
        )
    }

    /// Creates a name input field.
    ///
    /// Generates a `DSTextField` for entering names. It supports a custom validation pattern for names,
    /// defaulting to a basic name pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic name pattern.
    ///   - identifier: An optional identifier for the text field.
    /// - Returns: A `DSTextField` configured for name entry.
    static func name(value: DSTextFieldValue,
                     placeholder: String = "Name",
                     customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .name,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$",
            keftSystemName: "person.crop.circle",
            validateMinimumLength: 3,
            validateMaximumLength: 35,
            validateEmptyTextField: false
        )
    }
    
    /// Creates a given name (first name) input field.
    ///
    /// Generates a `DSTextField` specifically for entering given names. It supports a custom validation pattern,
    /// defaulting to a basic name pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic name pattern.
    ///   - identifier: An optional identifier for the text field.
    /// - Returns: A `DSTextField` configured for given name entry.
    static func givenName(value: DSTextFieldValue,
                          placeholder: String = "Given Name",
                          customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .givenName,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$",
            keftSystemName: "person.crop.circle",
            validateMinimumLength: 3,
            validateMaximumLength: 35,
            validateEmptyTextField: false
        )
    }
    
    /// Creates a family name (last name) input field.
    ///
    /// Generates a `DSTextField` specifically for entering family names. It supports a custom validation pattern,
    /// defaulting to a basic name pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic name pattern.
    ///   - identifier: An optional identifier for the text field.
    /// - Returns: A `DSTextField` configured for family name entry.
    static func familyName(value: DSTextFieldValue,
                           placeholder: String = "Family Name",
                           customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .familyName,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z\\s\\'\\-]*$",
            keftSystemName: "person.crop.circle",
            validateMinimumLength: 3,
            validateMaximumLength: 35,
            validateEmptyTextField: false
        )
    }

    /// Creates a number input field.
    ///
    /// Generates a `DSTextField` specifically for entering numbers. It supports a custom validation pattern for numbers,
    /// defaulting to a numeric pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a numeric pattern.
    /// - Returns: A `DSTextField` configured for number entry.
    static func number(value: DSTextFieldValue,
                       placeholder: String = "Number",
                       customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .numberPad,
            textContentType: nil, // Adjust if there's a more appropriate content type for numbers
            autocapitalizationType: .none,
            validationPattern: customValidationPattern ?? "^[0-9]*$",
            keftSystemName: "number.circle",
            validateMinimumLength: 3,
            validateMaximumLength: 35,
            validateEmptyTextField: false
        )
    }

    /// Creates an address input field.
    ///
    /// Generates a `DSTextField` specifically for entering addresses. It supports a custom validation pattern for addresses,
    /// defaulting to a basic address pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic address pattern.
    /// - Returns: A `DSTextField` configured for address entry.
    static func address(value: DSTextFieldValue,
                        placeholder: String = "Address",
                        customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .fullStreetAddress,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$",
            keftSystemName: "house",
            validateMinimumLength: 3,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }

    /// Creates a search input field.
    ///
    /// Generates a `DSTextField` specifically for search queries. This field is optimized for search text, with no specific validation pattern.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    /// - Returns: A `DSTextField` configured for search input.
    static func search(value: DSTextFieldValue,
                       placeholder: String = "Search") -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .none, // Adjust as needed
            autocapitalizationType: .sentences,
            validationPattern: "", // No specific validation pattern
            keftSystemName: "magnifyingglass",
            validateMinimumLength: 0,
            validateMaximumLength: 200,
            validateEmptyTextField: true // Adjust based on whether empty search is allowed
        )
    }
    
    /// Creates a street address line 1 input field.
    ///
    /// Generates a `DSTextField` specifically for entering the first line of a street address. It supports a custom validation pattern for addresses,
    /// defaulting to a basic address pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic address pattern.
    /// - Returns: A `DSTextField` configured for street address line 1 entry.
    static func streetAddressLine1(value: DSTextFieldValue,
                                   placeholder: String = "Street Address Line 1",
                                   customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .streetAddressLine1,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$",
            keftSystemName: "house",
            validateMinimumLength: 3,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }

    /// Creates a street address line 2 input field.
    ///
    /// Generates a `DSTextField` specifically for entering the second line of a street address. It supports a custom validation pattern for addresses,
    /// defaulting to a basic address pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic address pattern.
    /// - Returns: A `DSTextField` configured for street address line 2 entry.
    static func streetAddressLine2(value: DSTextFieldValue,
                                   placeholder: String = "Street Address Line 2",
                                   customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .streetAddressLine2,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$",
            keftSystemName: "house",
            validateMinimumLength: 3,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }
    
    /// Creates an address state input field.
    ///
    /// Generates a `DSTextField` specifically for entering the state in an address. It supports a custom validation pattern for addresses,
    /// defaulting to a basic address pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic address pattern.
    /// - Returns: A `DSTextField` configured for address state entry.
    static func addressState(value: DSTextFieldValue,
                             placeholder: String = "State",
                             customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .addressState,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$",
            keftSystemName: "network",
            validateMinimumLength: 3,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }
    
    /// Creates an address city input field.
    ///
    /// Generates a `DSTextField` specifically for entering city names in an address. It supports a custom validation pattern for city names,
    /// defaulting to a basic address pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic address pattern.
    /// - Returns: A `DSTextField` configured for address city entry.
    static func addressCity(value: DSTextFieldValue,
                            placeholder: String = "City",
                            customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .addressCity,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$",
            keftSystemName: "building.2",
            validateMinimumLength: 3,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }

    /// Creates an address city and state input field.
    ///
    /// Generates a `DSTextField` specifically for entering both city and state names in an address. It supports a custom validation pattern for city and state names,
    /// defaulting to a basic address pattern if none is provided.
    ///
    /// - Parameters:
    ///   - value: The current text field value as `DSTextFieldValue`.
    ///   - placeholder: Placeholder text.
    ///   - customValidationPattern: Optional custom pattern for validation. Defaults to a basic address pattern.
    /// - Returns: A `DSTextField` configured for address city and state entry.
    static func addressCityAndState(value: DSTextFieldValue,
                                    placeholder: String = "City & State",
                                    customValidationPattern: String? = nil) -> DSTextField {
        DSTextField(
            model: value,
            placeholder: placeholder,
            isSecureEntry: false,
            keyboardType: .default,
            textContentType: .addressCityAndState,
            autocapitalizationType: .words,
            validationPattern: customValidationPattern ?? "^[\\u0600-\\u06FFa-zA-Z0-9\\s\\'\\-]*$",
            keftSystemName: "house",
            validateMinimumLength: 3,
            validateMaximumLength: 250,
            validateEmptyTextField: false
        )
    }
}
