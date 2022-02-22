//
//  TextFieldInvalidDataVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldInvalidDataVC: DSViewController {
    
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
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
        // Email
        let email = DSTextFieldVM.email(text: "Ivan", placeholder: "Email")
        email.leftSFSymbolName = "envelope.fill"
        
        // Password
        let password = DSTextFieldVM.password(text: "qqq",placeholder: "Password")
        password.leftSFSymbolName = "lock.shield.fill"
        
        // Section
        let section = [fullName, email, password].list()
        
        // Header
        section.headlineHeader("User form")
        
        // Footer
        section.subheadlineFooter("Form description")
        
        // Show
        show(content: section)
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension TextFieldInvalidDataVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Icons"
    }
    
    var documentSubtitle: String {
        "Ivalid data"
    }
    
    var documentCode: String {
        """
        // Full name
        let fullName = DSTextFieldVM.name(text: "12345",placeholder: "Full Name")
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
        // Email
        let email = DSTextFieldVM.email(text: "Ivan", placeholder: "Email")
        email.leftSFSymbolName = "envelope.fill"
        
        // Password
        let password = DSTextFieldVM.password(text: "qqq",placeholder: "Password")
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
