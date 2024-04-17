//
//  TextFieldShortcutsVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldShortcutsVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Email
        let email = DSTextFieldVM.email(placeholder: "Email")
        email.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Phone
        let phone = DSTextFieldVM.phone(placeholder: "Phone")
        phone.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Secure Code
        let secureCode = DSTextFieldVM.secureCode(placeholder: "Secure Code")
        secureCode.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Password
        let password = DSTextFieldVM.password(placeholder: "Password")
        password.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // New Password
        let newPassword = DSTextFieldVM.newPassword(placeholder: "New Password")
        newPassword.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Name
        let name = DSTextFieldVM.name(placeholder: "Name")
        name.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Given Name
        let givenName = DSTextFieldVM.givenName(placeholder: "Given Name")
        givenName.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Family Name
        let familyName = DSTextFieldVM.familyName(placeholder: "Family Name")
        familyName.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Number
        let number = DSTextFieldVM.number(placeholder: "Number")
        number.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Address
        let address = DSTextFieldVM.address(placeholder: "Address")
        number.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Street Address Line 1
        let streetAddressLine1 = DSTextFieldVM.streetAddressLine1(placeholder: "Street Address Line 1")
        streetAddressLine1.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Street Address Line 2
        let streetAddressLine2 = DSTextFieldVM.streetAddressLine2(placeholder: "Street Address Line 2")
        streetAddressLine2.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Address State
        let addressState = DSTextFieldVM.addressState(placeholder: "Address State")
        addressState.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Address City
        let addressCity = DSTextFieldVM.addressCity(placeholder: "Address City")
        addressCity.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Address City And State
        let addressCityAndState = DSTextFieldVM.addressCityAndState(placeholder: "Address City And State")
        addressCityAndState.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Search
        let search = DSTextFieldVM.search(placeholder: "Search")
        search.didUpdate = { tf in
            print(tf.text ?? "No value")
        }
        
        // Show
        show(content: [email,
                       phone,
                       secureCode,
                       password,
                       newPassword,
                       name,
                       givenName,
                       familyName,
                       number,
                       address,
                       streetAddressLine1,
                       streetAddressLine2,
                       addressState,
                       addressCity,
                       addressCityAndState,
                       search])
        
        // Demo end
    }
}

extension TextFieldShortcutsVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Shortcuts"
    }
    
    var documentSubtitle: String {
        "Shortcuts"
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
