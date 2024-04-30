//
//  ListSeparatorLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListSeparatorLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "List"
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let texts = ["Miraculous","Lassitude","Gossamer","Bungalow","Scintilla"]
        
        let viewModels: [DSViewModel] = texts.map { (text) -> DSLabelVM in
            DSLabelVM(.body, text: text)
        }
        
        show(content: viewModels.list(separator: true))
        // Demo end
    }
}

extension ListSeparatorLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Content"
    }
    
    var documentSubtitle: String {
        "Show list with separator"
    }
    
    var documentCode: String {
        """
        let texts = ["Miraculous","Lassitude","Gossamer","Bungalow","Scintilla"]

        let viewModels: [DSViewModel] = texts.map { (text) -> DSTextVM in
            DSTextVM(.body, text: text)
        }

        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

