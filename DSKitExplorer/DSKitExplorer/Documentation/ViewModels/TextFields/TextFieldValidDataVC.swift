//
//  TextFieldValidDataVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldValidDataVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Full name
        let fullName = DSTextFieldVM.name(text: "Borinschi Ivan",placeholder: "Full Name")
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
        // Email
        let email = DSTextFieldVM.email(text: "imodeveloperlab@gmail.com", placeholder: "Email")
        email.leftSFSymbolName = "envelope.fill"
        
        // Password
        let password = DSTextFieldVM.password(text: "qqqqqqqq",placeholder: "Password")
        password.leftSFSymbolName = "lock.shield.fill"
        
        // Section
        let section = [fullName, email, password].list()
        
        // Show
        show(content: section)
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension TextFieldValidDataVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Icons"
    }
    
    var documentSubtitle: String {
        "Valid data"
    }
    
    var documentCode: String {
        """
        // Full name
        let fullName = DSTextFieldVM.name(text: "Borinschi Ivan",placeholder: "Full Name")
        fullName.leftSFSymbolName = "person.crop.circle.fill"
        
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
