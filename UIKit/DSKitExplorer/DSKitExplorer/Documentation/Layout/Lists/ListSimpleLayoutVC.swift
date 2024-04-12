//
//  ListSimpleLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListSimpleLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]
        
        let viewModels = texts.map { (text) -> DSViewModel in
            DSLabelVM(.body, text: text)
        }
        
        show(content: viewModels.list())
        // Demo end
    }
}

extension ListSimpleLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "List"
    }
    
    var documentSubtitle: String {
        "Simple list"
    }
    
    var documentCode: String {
        """
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

        let viewModels = texts.map { (text) -> DSViewModel in
            DSLabel(.body, text: text)
        }

        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
