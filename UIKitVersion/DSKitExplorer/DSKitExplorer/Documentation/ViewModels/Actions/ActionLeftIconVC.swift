//
//  ActionLeftIconVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionLeftIconVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Data
        let data = ["Petrichor": "leaf.fill", "Sumptuous": "safari.fill", "Angst": "paintbrush.pointed.fill"]
        let sortedData = data.sorted(by: { $0 < $1 })
        
        // Map data into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            var action = DSActionVM(title: text.key)
            action.leftIcon(sfSymbolName: text.value)
            return action
        }
        
        // Show
        show(content: actions)
        
        // Demo end
    }
}

extension ActionLeftIconVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Left icons"
    }
    
    var documentCode: String {
        """
        // Data
        let data = ["Petrichor": "leaf.fill", "Sumptuous": "safari.fill", "Angst": "paintbrush.pointed.fill"]
        let sortedData = data.sorted(by: { $0 < $1 })
        
        // Map data into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            var action = DSActionVM(title: text.key)
            action.leftIcon(sfSymbolName: text.value)
            return action
        }
        
        // Show
        show(content: actions)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

