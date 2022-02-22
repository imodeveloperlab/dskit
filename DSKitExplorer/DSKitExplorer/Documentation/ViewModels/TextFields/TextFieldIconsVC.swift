//
//  TextFieldsGroupedVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldIconsVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Full name
        let fullName = DSTextFieldVM.name(placeholder: "Full Name")
        
        // Set left sf symbol https://developer.apple.com/sf-symbols/
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
        // Email
        let email = DSTextFieldVM.email(placeholder: "Email")
        
        // Set left sf symbol https://developer.apple.com/sf-symbols/
        email.leftSFSymbolName = "envelope.fill" 
        
        // Password
        let password = DSTextFieldVM.password(placeholder: "Password")
        
        // Set left sf symbol https://developer.apple.com/sf-symbols/
        password.leftSFSymbolName = "lock.shield.fill"
        
        // Section
        let section = [fullName, email, password].list(grouped: true)
        
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

extension TextFieldIconsVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Icons"
    }
    
    var documentSubtitle: String {
        "Icons"
    }
    
    var documentCode: String {
        """
        // Full name
        let fullName = DSTextFieldVM.name(placeholder: "Full Name")
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
        // Email
        let email = DSTextFieldVM.email(placeholder: "Email")
        email.leftSFSymbolName = "envelope.fill"
        
        // Password
        let password = DSTextFieldVM.password(placeholder: "Password")
        password.leftSFSymbolName = "lock.shield.fill"
        
        // Section
        let section = [fullName, email, password].list(grouped: true)
        
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
