//
//  DSTextFieldVM.swift
//  DSKit
//
//  Created by Borinschi Ivan on 16.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//
//

import UIKit

public class DSTextFieldVM: DSViewModel, Equatable, Hashable {
    
    // Properties
    public var placeholder: String
    public var text: String?
    
    internal weak var textField: UITextField?
    
    // Validator
    let validator = DSStringValidator()
    
    /// Init textfield with text and placeholder
    /// - Parameters:
    ///   - text: Optional String
    ///   - placeholder: String
    public init(text: String? = nil, placeholder: String) {
        self.text = text
        self.placeholder = placeholder
    }
    
    // Height
    public var height: DSViewModelHeight?
    
    // Show an icon on the left side of textfield
    public var leftSFSymbolName: String?
    
    // Textfield unique identifier
    public var identifier = "TextField"
    
    // Accessibility identifier
    public var accessibilityIdentifier: String = "TextField"
    
    // Style of the border
    public var borderStyle: DSViewModelBorderStyle = .none
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle() {
        didSet {
            borderStyle = style.borderStyle
            style.borderStyle = .none
        }
    }
    
    // Show an message when user type non valid text in textfield
    public var errorPlaceHolderText: String?
    
    // Validate minimum length
    public var validateMinimumLength: Int = 0
    
    // Validate maximum length
    public var validateMaximumLength: Int = 240
    
    // Keyboard type
    public var keyboardType: UIKeyboardType = .default
    
    // Text content type
    public var textContentType: UITextContentType? = nil
    
    // Controls the display of the return key
    public var returnKeyType: UIReturnKeyType = .default
    
    // Autocapitalization Type
    public var autocapitalizationType: UITextAutocapitalizationType = .none
    
    // Validation regex
    public var validationPattern: String = patternLetters
    
    // Should textfield to not show validation error if it is empty
    public var validateEmptyTextField: Bool = true
    
    // Is textfield secured
    public var isSecured: Bool = false
    
    // Textfield type
    public var type: TextFieldViewModelType = .default
    
    // First responder
    public var isFirstResponder: Bool {
        get {
            return textField?.isFirstResponder ?? false
        }
        set {
            if newValue {
                textField?.becomeFirstResponder()
            } else {
                textField?.resignFirstResponder()
            }
        }
    }
    
    // Handle did tap
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    // Handle did update
    @NonEquatable public var didUpdate: ((DSTextFieldVM) -> Void)?
    
    // Handle 'return' key press. Return 'false' to ignore.
    @NonEquatable public var shouldReturn: ((DSTextFieldVM) -> Bool)?
    
    // Handle validation
    @NonEquatable public var handleValidation: ((String?) -> Bool)?
    
    // Tell textfield to validate itself
    @NonEquatable public var validateTextField: (() -> Void)?
    
    public static func == (lhs: DSTextFieldVM, rhs: DSTextFieldVM) -> Bool {
        return lhs.placeholder == rhs.placeholder &&
            lhs.identifier == rhs.identifier &&
            lhs.text == rhs.text &&
            lhs.accessibilityIdentifier == rhs.accessibilityIdentifier &&
            lhs.errorPlaceHolderText == rhs.errorPlaceHolderText &&
            lhs.validateMinimumLength == rhs.validateMinimumLength &&
            lhs.validateMaximumLength == rhs.validateMaximumLength &&
            lhs.validationPattern == rhs.validationPattern &&
            lhs.validateEmptyTextField == rhs.validateEmptyTextField &&
            lhs.isSecured == rhs.isSecured &&
            lhs.type == rhs.type &&
            lhs.keyboardType == rhs.keyboardType &&
            lhs.textContentType == rhs.textContentType &&
            lhs.returnKeyType == rhs.returnKeyType &&
            lhs._didTap == rhs._didTap &&
            lhs._didUpdate == rhs._didUpdate &&
            lhs._handleValidation == rhs._handleValidation
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(placeholder)
        hasher.combine(identifier)
        hasher.combine(text)
        hasher.combine(keyboardType)
        hasher.combine(textContentType)
        hasher.combine(returnKeyType)
        hasher.combine(accessibilityIdentifier)
        hasher.combine(errorPlaceHolderText)
        hasher.combine(validateMinimumLength)
        hasher.combine(validateMaximumLength)
        hasher.combine(validationPattern)
        hasher.combine(isSecured)
        hasher.combine(type)
        hasher.combine(validateEmptyTextField)
    }
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
    
    /// Companion object
    @NonEquatable public var object: AnyObject?
}

/// Textfield type
public enum TextFieldViewModelType: Equatable, Hashable {
    case `default`
}

public extension DSTextFieldVM {
    
    // Reusable identifier
    func reuseIdentifier() -> String {
        return hash()
    }
    
    /// Get view model height
    /// - Parameters:
    ///   - layoutEnvironment: NSCollectionLayoutEnvironment
    ///   - section: DSSection
    /// - Returns: DSViewModelHeight
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight  {
        
        if let height = height {
            return height
        }
        
        switch type {
        case .default:
            return .absolute(43)
        }
    }
    
    /// View model view representation
    /// - Returns: DSReusableUIView
    func viewRepresentation() -> DSReusableUIView {
        return DSTextFieldUIView.instanceFromNib()
    }
    
    /// Is this view model equal to other one
    /// - Parameter model: DSViewModel
    /// - Returns: Bool
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    /// View model hash
    /// - Returns: String
    func hash() -> String {
        return hashValue.string()
    }
}
