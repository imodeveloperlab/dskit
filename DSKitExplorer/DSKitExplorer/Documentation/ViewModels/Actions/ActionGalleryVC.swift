//
//  ActionGalleryVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ActionGalleryVC: DSViewController {
    
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
        show(content: viewModels.gallery())
        
        // Demo end
    }
}

extension ActionGalleryVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Action gallery"
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
        show(content: viewModels.gallery())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
