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
        let email = DSTextFieldVM(placeholder: "Email")
        let password = DSTextFieldVM(placeholder: "Password")
        
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
        let email = DSTextFieldVM(placeholder: "Email")
        let password = DSTextFieldVM(placeholder: "Password")
        
        // Show
        show(content: fullName, email, password)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
