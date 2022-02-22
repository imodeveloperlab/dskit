//
//  TextFieldsGroupedVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldsGroupedVC: DSViewController {
    
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
        let email = DSTextFieldVM(placeholder: "Email")
        let password = DSTextFieldVM(placeholder: "Password")
        
        // Text fields section
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

extension TextFieldsGroupedVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Text Field"
    }
    
    var documentSubtitle: String {
        "Grouped"
    }
    
    var documentCode: String {
        """
        // Text fields
        let fullName = DSTextFieldVM(placeholder: "Full Name")
        let email = DSTextFieldVM(placeholder: "Email")
        let password = DSTextFieldVM(placeholder: "Password")
        
        // Text fields section
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
