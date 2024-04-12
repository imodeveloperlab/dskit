//
//  ButtonGridVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ButtonGridVC: DSViewController {
    
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
            
            // Handle did tap on button
            button.didTap { [unowned self] (button: DSButtonVM) in
                self.show(message: text)
            }
            return button
        }
        
        // Show
        show(content: viewModels.grid())
        
        // Demo end
    }
}

extension ButtonGridVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Button grid"
    }
    
    var documentSubtitle: String {
        "Grid"
    }
    
    var documentCode: String {
        """
        // Texts
        let texts = ["Petrichor", "Sumptuous", "Angst", "Aesthete", "Nadir"]
        
        // Map texts into an array of view models
        let viewModels = texts.map { (text) -> DSViewModel in
            var button = DSButtonVM(title: text)
            button.didTap { [unowned self] (button: DSButtonVM) in
                self.show(message: text)
            }
            return button
        }
        
        // Show
        show(content: viewModels.grid())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
