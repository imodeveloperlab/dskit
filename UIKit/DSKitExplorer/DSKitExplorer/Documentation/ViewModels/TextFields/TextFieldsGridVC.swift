//
//  TextFieldsGridVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldsGridVC: DSViewController {
    
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
        
        // Show
        show(content: [fullName, email, password].grid())
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension TextFieldsGridVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Text Field"
    }
    
    var documentSubtitle: String {
        "Grid"
    }
    
    var documentCode: String {
        """
        // Text fields
        let fullName = DSTextFieldVM(placeholder: "Full Name")
        let email = DSTextFieldVM(placeholder: "Email")
        let password = DSTextFieldVM(placeholder: "Password")
        
        // Show
        show(content: [fullName, email, password].grid())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
