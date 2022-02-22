//
//  ListGroupedAndSeparatorLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListGroupedAndSeparatorLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let texts = ["Cherish", "Demure", "Elixir", "Eternity", "Felicity"]
        
        let viewModels: [DSViewModel] = texts.map { (text) -> DSLabelVM in
            DSLabelVM(.body, text: text)
        }
        
        show(content: viewModels.list(separator: true, grouped: true))
        
        // Demo end
    }
}

extension ListGroupedAndSeparatorLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "List"
    }
    
    var documentSubtitle: String {
        "Show grouped list with separators"
    }
    
    var documentCode: String {
        """
        let texts = ["Cherish","Demure","Elixir","Eternity","Felicity"]

        let viewModels: [DSViewModel] = texts.map { (text) -> DSTextVM in
            DSTextVM(.body, text: text)
        }

        show(content: viewModels.list(separator: true, grouped: true))
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
