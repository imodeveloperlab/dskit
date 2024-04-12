//
//  ImagesVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldsVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Text fields
        let fullName = DSTextFieldVM(placeholder: "Full Name")
        fullName.returnKeyType = .next
        
        let email = DSTextFieldVM(placeholder: "Email")
        email.returnKeyType = .next
        
        let password = DSTextFieldVM(placeholder: "Password")
        password.returnKeyType = .done
        
        fullName.shouldReturn = { _ in
            email.isFirstResponder = true
            
            return true
        }
        
        email.shouldReturn = { _ in
            password.isFirstResponder = true
            
            return true
        }
        
        password.shouldReturn = { textFieldVM in
            textFieldVM.isFirstResponder = false
            
            return true
        }
        
        // Show
        show(content: fullName, email, password)
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension TextFieldsVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Text Fields"
    }
    
    var documentSubtitle: String {
        "Text Fields"
    }
    
    var documentCode: String {
        """
        // Text fields
        let fullName = DSTextFieldVM(placeholder: "Full Name")
        fullName.returnKeyType = .next
        
        let email = DSTextFieldVM(placeholder: "Email")
        email.returnKeyType = .next
        
        let password = DSTextFieldVM(placeholder: "Password")
        password.returnKeyType = .done
        
        fullName.shouldReturn = { _ in
            email.isFirstResponder = true
            
            return true
        }
        
        email.shouldReturn = { _ in
            password.isFirstResponder = true
            
            return true
        }
        
        password.shouldReturn = { textFieldVM in
            textFieldVM.isFirstResponder = false
            
            return true
        }
        
        // Show
        show(content: fullName, email, password)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
