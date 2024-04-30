//
//  ActionListVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ActionListVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Texts
        let texts = ["Petrichor", "Sumptuous", "Angst", "Aesthete", "Nadir"]
        
        // Map texts into an array of view models
        let viewModels = texts.map { (text) -> DSViewModel in
            DSActionVM(title: text)
        }
        
        // Show
        show(content: viewModels.list())
        
        // Demo end
    }
}

extension ActionListVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "List of actions"
    }
    
    var documentCode: String {
        """
        // Texts
        let texts = ["Petrichor", "Sumptuous", "Angst", "Aesthete", "Nadir"]
        
        // Map texts into an array of view models
        let viewModels = texts.map { (text) -> DSViewModel in
            DSActionVM(title: text)
        }
        
        // Show
        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
