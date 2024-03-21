//
//  DSTextField.swift
//  DSKitCore
//
//  Created by Ivan Borinschi on 28.12.2022.
//

import SwiftUI
import UIKit

public struct DSTextField: View {
    
    // Environment properties for theming and color customization
    @Environment(\.appearance) private var appearance: DSAppearance
    @Environment(\.colorGroup) private var colorGroup: DSColorGroup
    
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
    let leftSFSymbolName: String?
    let validateMinimumLength: Int
    let validateMaximumLength: Int
    let validateEmptyTextField: Bool
    
    public var body: some View {
        DSHStack {
            if let symbolName = leftSFSymbolName {
                let tint = hasText ?  colorGroup.colors(from: appearance).textField.text : colorGroup.colors(from: appearance).textField.placeHolder
                DSImageView(sfSymbol: symbolName, size: 15, tint: .custom(tint))
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
                let sfSymbolName = isSecureEntryVisible ? "eye.slash" : "eye"
                let tint = colorGroup.colors(from: appearance).textField.text
                DSImageView(sfSymbol: sfSymbolName, size: 15, tint: .custom(tint))
                    .onTap {
                        isSecureEntryVisible.toggle()
                    }
            } else if isEditing && hasText {
                // Displays a clear button when the text field is being edited and has text
                let tint = colorGroup.colors(from: appearance).textField.text
                DSImageView(sfSymbol: "xmark.circle.fill", size: 15, tint: .custom(tint)).onTapGesture {
                    model.text = ""
                }
            }
        }
        .dsHeight(.custom(appearance.actionElementHeight))
        .dsPadding(.horizontal, .custom(appearance.size.number(for: .regular) - 1))
        .dsBackground(.custom(colorGroup.colors(from: appearance).textField.background))
        .dsCornerRadius()
        .overlay(
            // Outlines the text field in red if the content is invalid
            RoundedRectangle(cornerRadius: colorGroup.colors(from: appearance).cornerRadius)
                .stroke(model.isValid ? colorGroup.colors(from: appearance).textField.background.color : Color.red, lineWidth: 1)
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

struct DSTextFieldViewPreview: View {
    
    @State private var email = DSTextFieldValue()
    @State private var phone = DSTextFieldValue()
    @State private var password = DSTextFieldValue()
    
    var body: some View {
        ScrollView {
            DSVStack {
                DSVStack {
                    DSTextField.email(value: email)
                    DSTextField.phone(value: phone)
                    DSTextField.password(value: password)
                }
                .dsPadding()
                .dsSecondaryBackground()
                .dsCornerRadius()
                
                DSVStack {
                    DSTextField.email(value: email)
                    DSTextField.phone(value: phone)
                    DSTextField.password(value: password)
                }
                
                DSButton(title: "Subbmit") {
                    for element in [email, password, phone] {
                        let isValid = element.validate()
                        if !isValid {
                            break
                        }
                    }
                }
            }
        }.dsPadding()
    }
}

struct DSTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewForEach {
            DSFullScreen {
                DSTextFieldViewPreview()
            }
        }
    }
}
