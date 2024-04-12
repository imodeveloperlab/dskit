//
//  ActionRightImageVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionRightButtonVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Action 1
        var action = DSActionVM(title: "Action", subtitle: "Button")
        action.rightButton(sfSymbolName: "cart.fill.badge.plus") { [unowned self] in
            self.show(message: "Did tap on button")
        }
        
        // Action 2
        var action2 = DSActionVM(title: "Action", subtitle: "Small button")
        action2.rightButton(title: "Small", sfSymbolName: "trash.fill", style: .small) { [unowned self] in
            self.show(message: "Did tap on small button")
        }
        
        // Action 3
        var action3 = DSActionVM(title: "Action", subtitle: "Medium button")
        action3.rightButton(title: "Medium", sfSymbolName: "trash.fill", style: .medium) { [unowned self] in
            self.show(message: "Did tap on medium button")
        }
        
        // Action 4
        var action4 = DSActionVM(title: "Action", subtitle: "Large button")
        action4.rightButton(title: "Large", sfSymbolName: "trash.fill", style: .large) { [unowned self] in
            self.show(message: "Did tap on large button")
        }
        
        // Show
        show(content: action, action2, action3, action4)
        
        // Demo end
    }
}

extension ActionRightButtonVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Right button"
    }
    
    var documentCode: String {
        """
        // Action 1
        var action = DSActionVM(title: "Action", subtitle: "Button")
        action.rightButton(sfSymbolName: "cart.fill.badge.plus") { [unowned self] in
            self.show(message: "Did tap on button")
        }
        
        // Action 2
        var action2 = DSActionVM(title: "Action", subtitle: "Small button")
        action2.rightButton(title: "Small", sfSymbolName: "trash.fill", style: .small) { [unowned self] in
            self.show(message: "Did tap on small button")
        }
        
        // Action 3
        var action3 = DSActionVM(title: "Action", subtitle: "Medium button")
        action3.rightButton(title: "Medium", sfSymbolName: "trash.fill", style: .medium) { [unowned self] in
            self.show(message: "Did tap on medium button")
        }
        
        // Action 4
        var action4 = DSActionVM(title: "Action", subtitle: "Large button")
        action4.rightButton(title: "Large", sfSymbolName: "trash.fill", style: .large) { [unowned self] in
            self.show(message: "Did tap on large button")
        }
        
        // Show
        show(content: action, action2, action3, action4)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
