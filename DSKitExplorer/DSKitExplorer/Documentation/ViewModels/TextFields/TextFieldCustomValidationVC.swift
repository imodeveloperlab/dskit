//
//  TextFieldCustomValidationVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldCustomValidationVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Custom text field for full name
        let fullName = DSTextFieldVM(text: "Borinschi Ivan", placeholder: "Full Name")
        
        // Handle text field validation
        fullName.handleValidation = { textFieldText in
            
            // Check if text is not nil
            guard let text = textFieldText else {
                return false
            }
            
            if text.contains("123") {
                
                // Set textfield as invalid state
                return false
                
            } else {
                
                // Set textfield as valid state
                return false
            }
        }
        
        // Handle textfield update, this closure is called every time
        // user type a character in textfield
        fullName.didUpdate = { textField in
            print(textField.text ?? "No value")
        }
        
        // Show
        show(content: fullName)
        
        // Demo end
    }
}

extension TextFieldCustomValidationVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Custom Validation"
    }
    
    var documentSubtitle: String {
        "Custom Validation"
    }
    
    var documentCode: String {
        """
        // Full name
        let fullName = DSTextFieldVM.name(text: "Borinschi Ivan",placeholder: "Full Name")
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
        // Minimum 4 characters for textfield to be valid
        fullName.validateMinimumLength = 4
        
        // Maximum 50 characters for textfield to be valid
        fullName.validateMinimumLength = 50
        
        // Validation regular expression
        fullName.validationPattern = "^[a-zA-Z]*$"
        
        // Email
        let email = DSTextFieldVM.email(text: "imodeveloperlab@gmail.com", placeholder: "Email")
        email.leftSFSymbolName = "envelope.fill"
        
        // Password
        let password = DSTextFieldVM.password(text: "qqqqqqqq",placeholder: "Password")
        password.leftSFSymbolName = "lock.shield.fill"
        
        // Section
        let section = [fullName, email, password].list()
        
        // Header
        section.headlineHeader("User form")
        
        // Footer
        section.subheadlineFooter("Form description")
        
        // Show
        show(content: section)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
