//
//  DSTextFieldUIView.swift
//  DSKit
//
//  Created by Borinschi Ivan on 16.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

final class DSTextFieldUIView: UIView, DSReusableUIView {
    
    // Textfield components
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldHolder: UIView!
    
    // Constraints
    @IBOutlet weak var textFieldLeftSpace: NSLayoutConstraint!
    @IBOutlet var textFieldBottomSpace: NSLayoutConstraint!
    
    // View model
    var viewModel: DSTextFieldVM?
    var appearance = DSAppearance.shared.main
    
    // DSReusableUIView protocol
    public var view: UIView { self }
    
    /// This method is called each time a copy of DSTextFieldUIView is prepared to be displayed on screen
    /// - Parameter viewModel: DSViewModel
    public func setUpWith(viewModel: DSViewModel) {
        
        guard let viewModel = viewModel as? DSTextFieldVM else {
            return
        }
        self.viewModel = viewModel
        update(viewModel: viewModel)
        updateLayout(viewModel: viewModel)
    }
    
    /// Update view with view model
    /// - Parameter viewModel: DSActionVM
    func update(viewModel: DSTextFieldVM) {
        
        // Set up textfield validations
        handleTextFieldValidation()
        
        // Set textfield values
        textField.placeholder = viewModel.placeholder
        textField.text = viewModel.text
        textField.isSecureTextEntry = viewModel.isSecured
        
        if viewModel.didTap != nil {
            textField.isUserInteractionEnabled = false
        } else {
            textField.isUserInteractionEnabled = true
        }
        
        // Validate
        validate()
    }
    
    /// Update layout for view model
    /// - Parameter viewModel: DSTextFieldVM
    func updateLayout(viewModel: DSTextFieldVM) {
        
        let colors = viewModel.viewColors()
        
        // Textfield holder
        textFieldHolder.backgroundColor = colors.textField.background
        textFieldHolder.layer.cornerRadius = colors.cornerRadius
        
        // Textfield colors
        textField.font = appearance.fonts.body.withSize(14)
        textField.textColor = colors.textField.text
        textField.keyboardType = viewModel.keyboardType
        textField.textContentType = viewModel.textContentType
        textField.returnKeyType = viewModel.returnKeyType
        textField.autocapitalizationType = viewModel.autocapitalizationType
        textField.autocorrectionType = .no
        
        // Placeholder colors
        let placeholderText = textField.placeholder != nil ? textField.placeholder! : viewModel.placeholder
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: colors.textField.placeHolder])
        
        // Clear button colors
        setClearButtonImage(with: UIImage(systemName: "xmark.circle.fill"))
        
        // Update left view
        updateLeftView()
    }
    
    func updateLeftView() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        let colors = viewModel.viewColors()
        
        // If leftSFSymbolName exists then it will be shown on the left
        if let sfSymbolName = viewModel.leftSFSymbolName {
            
            let symbol = DSImage(content: .sfSymbol(name: sfSymbolName, style: .medium),
                                 displayStyle: .default,
                                 size: .size(CGSize(width: 22, height: 22)),
                                 tintColor: viewModel.text?.count ?? 0 > 0 ? .text(.headline) : .text(.subheadline),
                                 contentMode: .scaleAspectFit)
            
            textField.leftView = symbol.view(colors).subViewWith(insets: .init(top: 0, left: 0, bottom: 0, right: 8))
            textField.leftViewMode = .always
            textFieldLeftSpace.constant = appearance.groupMargins
            
        } else {
            textFieldLeftSpace.constant = appearance.groupMargins
        }
    }
    
    /// Validate this text field after delay
    /// - Parameter delay: TimeInterval
    func validate(delay: TimeInterval = 0.0) {
        
        guard let viewModel = viewModel else {
            return
        }
        
        // Update view model text
        let text = textField.text
        viewModel.text = text
        viewModel.didUpdate?(viewModel)
        
        // Validate new values
        viewModel.isValid(text: text, validateEmptyTextField: viewModel.validateEmptyTextField) { [self] isValid in
            
            NSObject.cancelPreviousPerformRequests(withTarget: self)
            if isValid {
                self.validStyle()
            } else {
                self.perform(#selector(invalidStyle), with: isValid, afterDelay: delay)
            }
        }
    }
    
    /// Set up textfield validations
    func handleTextFieldValidation() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        // This closure is called from view controller
        // to initiate this textfield validation
        viewModel.validateTextField = {
            
            let text = self.textField.text
            
            // Check is textfield is valid and show proper textfield style
            viewModel.isValid(text: text, validateEmptyTextField: false) { [self] isValid in
                if isValid {
                    self.validStyle()
                } else {
                    self.viewModel?.validateEmptyTextField = false
                    self.invalidStyle()
                }
            }
        }
    }
    
    /// Textfield valid style
    func validStyle() {
        textFieldHolder.layer.borderWidth = 0
        textFieldHolder.layer.borderColor = UIColor.clear.cgColor
    }
    
    /// Textfield invalid style
    @objc func invalidStyle() {
        textFieldHolder.layer.borderWidth = 1.0
        textFieldHolder.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    /// Hide invalid message
    func hideInvalidMessage() {
        UIView.animate(withDuration: 0.4) {
            self.messageLabel.alpha = 0.0
        }
    }
    
    /// Show invalid message
    func showInvalidMessageIfNeed() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        DispatchQueue.main.after(0.5) {
            viewModel.isValid(text: self.textField.text,
                              validateEmptyTextField: viewModel.validateEmptyTextField) { [self] isValid in
                if !isValid {
                    invalidMessageStyle()
                }
            }
        }
    }
    
    /// Textfield invalid message style
    @objc func invalidMessageStyle() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        if let text = viewModel.errorPlaceHolderText {
            
            let colors = viewModel.viewColors(mirrored: true)
            
            messageLabel.text = text
            messageLabel.textColor = colors.text.subheadline
            messageLabel.font = appearance.fonts.caption2.withSize(14)
            
            UIView.animate(withDuration: 0.4) {
                self.messageLabel.alpha = 1.0
            }
        }
        
        invalidStyle()
    }
    
    @IBAction func editingBegin(_ sender: Any) {
        hideInvalidMessage()
    }
    
    @IBAction func editingEnd(_ sender: Any) {
        showInvalidMessageIfNeed()
    }
    
    @IBAction func editingChange(_ sender: Any) {
        validate(delay: 5.0)
        updateLeftView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }
    
    /// Set clear button image
    /// - Parameter image: UIImage
    @objc func setClearButtonImage(with image : UIImage?) {
        
        guard let viewModel = viewModel else {
            return
        }
        
        let colors = viewModel.viewColors()
        
        // Button
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.tintColor = colors.button.background
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(clear(_:)), for: .touchUpInside)
        
        // Textfield
        textField.rightView = button.subViewWith(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: appearance.interItemSpacing))
        textField.rightViewMode = .whileEditing
    }
    
    /// Clear action
    /// - Parameter sender: AnyObject
    @objc func clear(_ sender : AnyObject) {
        textField.text = ""
        textField.sendActions(for: .editingChanged)
    }
    
    class func instanceFromNib() -> DSTextFieldUIView {
        let view: DSTextFieldUIView = initFromNib()
        return view
    }
}
