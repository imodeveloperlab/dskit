//
//  TextFieldBuiltInValidationVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldBuiltInValidationVC: DSViewController {
    
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
        
        // Minimum 4 characters for textfield to be valid
        fullName.validateMinimumLength = 4
        
        // Maximum 50 characters for textfield to be valid
        fullName.validateMaximumLength = 50
        
        // Validation regular expression
        fullName.validationPattern = "^[a-zA-Z]*$"
        
        // Handle textfield update, this closure is called every time user type a character in textfield
        fullName.didUpdate = { textField in
            print(textField.text)
        }
        
        // Show
        show(content: fullName)
        
        // Demo end
    }
}

extension TextFieldBuiltInValidationVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Built-in validation"
    }
    
    var documentSubtitle: String {
        "Built-in validation"
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
