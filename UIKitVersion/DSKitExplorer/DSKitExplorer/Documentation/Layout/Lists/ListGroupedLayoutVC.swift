//
//  ListGroupedLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListGroupedLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let texts = ["Aurora","Inure","Mellifluous","Euphoria","Serendipity"]
        
        let viewModels: [DSViewModel] = texts.map { (text) -> DSLabelVM in
            DSLabelVM(.body, text: text)
        }
        
        show(content: viewModels.list(grouped: true))
        // Demo end
    }
}

extension ListGroupedLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "List"
    }
    
    var documentSubtitle: String {
        "Grouped List"
    }
    
    var documentCode: String {
        """
        let texts = ["Aurora","Inure","Mellifluous","Euphoria","Serendipity"]

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
