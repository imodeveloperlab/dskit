//
//  DSCustomUITextField.swift
//  DSKit
//
//  Created by Ivan Borinschi on 29.12.2022.
//

import SwiftUI

struct DSCustomUITextField: UIViewRepresentable {
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    
    @Binding var text: String
    @Binding var isSecureEntry: Bool
    @Binding var isEditing: Bool
    
    var placeholder: String
    
    var keyboardType: UIKeyboardType
    var textContentType: UITextContentType?
    var autocapitalizationType: UITextAutocapitalizationType
    var onCommit: (() -> Void)?

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: viewStyle.colors(from: appearance).textField.placeHolder]
        )
        textField.font = appearance.fonts.subheadline
        textField.isSecureTextEntry = isSecureEntry
        textField.keyboardType = keyboardType
        textField.textContentType = textContentType
        textField.autocapitalizationType = autocapitalizationType
        textField.delegate = context.coordinator
        textField.textColor = viewStyle.colors(from: appearance).textField.text
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = isSecureEntry
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: DSCustomUITextField
        
        init(_ textField: DSCustomUITextField) {
            self.parent = textField
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onCommit?()
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isEditing = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isEditing = false
        }
    }
}
