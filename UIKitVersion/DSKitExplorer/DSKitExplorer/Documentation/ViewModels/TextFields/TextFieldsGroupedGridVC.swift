//
//  TextFieldsGroupedGridVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldsGroupedGridVC: DSViewController {
    
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
        show(content: [fullName, email, password].grid(grouped: true))
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension TextFieldsGroupedGridVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Text Field"
    }
    
    var documentSubtitle: String {
        "Grouped grid"
    }
    
    var documentCode: String {
        """
        // Text fields
        let fullName = DSTextFieldVM(placeholder: "Full Name")
        let email = DSTextFieldVM(placeholder: "Email")
        let password = DSTextFieldVM(placeholder: "Password")
        
        // Show
        show(content: [fullName, email, password].grid(grouped: true))
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
