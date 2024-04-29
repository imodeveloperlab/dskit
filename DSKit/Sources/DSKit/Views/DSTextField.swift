//
//  DSTextField.swift
//  DSKit
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI
import UIKit

/*
## DSTextField

`DSTextField` is a customizable SwiftUI component within the DSKit framework designed to handle user input, integrating essential functionalities such as security, validation, and appearance customization. It supports text input, secure entry for passwords, and validation based on various criteria.

#### Initialization:
Initializes a `DSTextField` with various options for handling different types of input and validation.
- Parameters:
- `name`: The name of the SF Symbol to display within the text field.
- `size`: The size of the symbol icon within the text field.

#### Usage:
`DSTextField` is suitable for forms, login screens, and any interface where user input is required. The secure entry option and input validation make it particularly useful for handling sensitive information.
*/

public struct DSTextField: View {
    
    // Environment properties for theming and color customization
    @Environment(\.appearance) private var appearance: DSAppearance
    @Environment(\.viewStyle) private var viewStyle: DSViewStyle
    
    // State variables to manage the visibility of secure text entry and editing status
    @State private var isSecureEntryVisible: Bool = false
    @State private var isEditing: Bool = false
    @State private var hasText: Bool = false
    @State private var readyToValidate: Bool = false
    @State private var didEdit: Bool = false
    
    // Object to observe and react to changes in the text field value
    @ObservedObject var model: DSTextFieldValue
    // Placeholder text for the text field
    let placeholder: String
    // Boolean to determine if the text field should be secure (for passwords)
    let isSecureEntry: Bool
    // Keyboard configuration properties
    let keyboardType: UIKeyboardType
    let textContentType: UITextContentType?
    let autocapitalizationType: UITextAutocapitalizationType
    let validationPattern: String
    let keftSystemName: String?
    let validateMinimumLength: Int
    let validateMaximumLength: Int
    let validateEmptyTextField: Bool
    
    public var body: some View {
        DSHStack {
            if let symbolName = keftSystemName {
                DSImageView(
                    systemName: symbolName,
                    size: 15,
                    tint: hasText ? .view(.textField(.text)) : .view(.textField(.placeholder))
                )
            }
            
            // The main text field component
            DSCustomUITextField(
                text: $model.text,
                isSecureEntry: $isSecureEntryVisible,
                isEditing: $isEditing,
                placeholder: placeholder,
                keyboardType: keyboardType,
                textContentType: textContentType,
                autocapitalizationType: autocapitalizationType
            )
            
            // Toggles visibility of the secure text entry (password visibility)
            if isSecureEntry {
                let systemName = isSecureEntryVisible ? "eye.slash" : "eye"
                DSImageView(systemName: systemName, size: 15, tint: .view(.textField(.text)))
                    .onTap {
                        isSecureEntryVisible.toggle()
                    }
            } else if isEditing && hasText {
                DSImageView(systemName: "xmark.circle.fill", size: 15, tint: .view(.textField(.text))).onTapGesture {
                    model.text = ""
                }
            }
        }
        .dsHeight(.custom(appearance.actionElementHeight))
        .dsPadding(.horizontal, .custom(appearance.spacing.value(for: .medium) - 1))
        .dsBackground(.viewStyle(viewStyle, .textField(.background)))
        .dsCornerRadius()
        .overlay(
            // Outlines the text field in red if the content is invalid
            RoundedRectangle(cornerRadius: viewStyle.colors(from: appearance).cornerRadius)
                .stroke(model.isValid ? viewStyle.colors(from: appearance).textField.background.color : Color.red, lineWidth: 1)
        )
        .padding(1)
        .onChange(of: model.text) { newValue in
            // Tracks whether the text field has content and if it was edited
            hasText = !newValue.isEmpty
            didEdit = true
            // Triggers validation when necessary
            if readyToValidate {
                validate()
            }
        }
        .onChange(of: isEditing) { newValue in
            // Prepares the text field for validation after editing
            if readyToValidate == false, newValue == false, didEdit {
                readyToValidate = true
            }
            // Triggers validation when editing ends
            if newValue == false, didEdit {
                validate()
            }
        }
        .onAppear {
            // Sets initial state for secure entry visibility
            isSecureEntryVisible = isSecureEntry
            // Assigns a closure for validation to the model
            model.validationClosure = {
                validate()
            }
        }
    }
    
    // Defines the validation logic for the text field
    private func validate() {
        // Checks for empty text field, minimum and maximum length, and matches against a regex pattern
        if model.text.isEmpty && validateEmptyTextField {
            model.isValid = true
        } else {
            model.isValid = DSTextfieldValidator.isValidMinimLength(validateMinimumLength, model.text) &&
            DSTextfieldValidator.isValidMaximLength(validateMaximumLength, model.text) &&
            DSTextfieldValidator.validate(string: model.text, pattern: validationPattern) &&
            DSTextfieldValidator.isValidWhiteSpaces(string: model.text)
        }
    }
}

struct Testable_DSTextField: View {
    
    @State private var name = DSTextFieldValue()
    @State private var email = DSTextFieldValue()
    @State private var phone = DSTextFieldValue()
    @State private var password = DSTextFieldValue()
    @State private var repeatPassword = DSTextFieldValue()
    
    var body: some View {
        ScrollView {
            DSVStack {
                DSVStack {
                    DSTextField.name(value: name)
                    DSTextField.phone(value: phone)
                    DSTextField.email(value: email)
                }
                .dsPadding()
                .dsSecondaryBackground()
                .dsCornerRadius()
                
                DSTextField.password(value: password)
                
                DSButton(title: "Subbmit") {
                    for element in [email, password, phone] {
                        let isValid = element.validate()
                        if !isValid {
                            break
                        }
                    }
                }
            }
        }
    }
}

struct DSTextField_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance {
            DSPreview {
                Testable_DSTextField()
            }
        }
    }
}
