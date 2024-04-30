//
//  ButtonListVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ButtonListVC: DSViewController {
    
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
            
            var button = DSButtonVM(title: text)
            
            // Handle button tap on button
            button.didTap { [unowned self] (button: DSButtonVM) in
                self.show(message: text)
            }
            
            return button
        }
        
        // Show
        show(content: viewModels.list())
        
        // Demo end
    }
}

extension ButtonListVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Button list"
    }
    
    var documentSubtitle: String {
        "List"
    }
    
    var documentCode: String {
        """
        // Texts
        let texts = ["Petrichor", "Sumptuous", "Angst", "Aesthete", "Nadir"]
        
        // Map texts into an array of view models
        let viewModels = texts.map { (text) -> DSViewModel in
            
            var button = DSButtonVM(title: text)
            
            // Handle button tap
            button.didTap { [unowned self] (button: DSButtonVM) in
                self.show(message: text)
            }
            
            return button
        }
        
        // Show
        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
