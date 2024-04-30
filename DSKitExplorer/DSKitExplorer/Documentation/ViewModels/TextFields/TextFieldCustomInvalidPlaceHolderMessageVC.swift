//
//  TextFieldCustomInvalidPlaceHolderMessageVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldCustomInvalidPlaceHolderMessageVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Full name
        let fullName = DSTextFieldVM.name(text: "12345",placeholder: "Full Name")
        fullName.errorPlaceHolderText = "Full name should not contain numbers"
        
        // Email
        let email = DSTextFieldVM.email(text: "Ivan", placeholder: "Email")
        email.errorPlaceHolderText = "Email example@example.com"
        
        // Password
        let password = DSTextFieldVM.password(text: "qqq",placeholder: "Password")
        email.errorPlaceHolderText = "Minimum length should be 8"
        
        // Section
        let section = [fullName, email, password].list()
        
        // Show
        show(content: section)
        
        // Demo end
    }
}

extension TextFieldCustomInvalidPlaceHolderMessageVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Custom Invalid Message"
    }
    
    var documentSubtitle: String {
        "Custom Invalid Message"
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
