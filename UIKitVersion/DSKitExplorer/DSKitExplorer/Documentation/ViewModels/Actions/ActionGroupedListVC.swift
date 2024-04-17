//
//  ActionGroupedListVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ActionGroupedListVC: DSViewController {
    
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
        
        // Map data into an array  of actions
        let actions = sortedData.map { text -> DSViewModel in
            var action = DSActionVM(title: text.key)
            action.leftIcon(sfSymbolName: text.value)
            action.height = .absolute(30)
            return action
        }
        
        // Show content
        show(content: actions.list(grouped: true), actions.list(separator: true, grouped: true))
        
        // Demo end
    }
}

extension ActionGroupedListVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Actions grouped"
    }
    
    var documentCode: String {
        """
        // Data
        let data = ["Petrichor": "leaf.fill", "Sumptuous": "safari.fill", "Angst": "paintbrush.pointed.fill"]
        let sortedData = data.sorted(by: { $0 < $1 })
        
        // Map texts into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            var action = DSActionVM(title: text.key)
            action.leftIcon(sfSymbolName: text.value)
            action.height = .absolute(30)
            return action
        }
        
        // Show content
        show(content: actions.list(grouped: true), actions.list(separator: true, grouped: true))
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
