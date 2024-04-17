//
//  GridSimpleHeaderFooterLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GridSimpleHeaderFooterLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        let viewModels = [1,2,3,4,5].map { (index) -> DSViewModel in
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(150)
            return viewModel
        }
        
        let section = viewModels.grid()
        section.header = DSLabelVM(.headline, text: "Header")
        section.footer = DSLabelVM(.headline, text: "Footer")
        
        show(content: section)
        // Demo end
    }
}

extension GridSimpleHeaderFooterLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Grid"
    }
    
    var documentSubtitle: String {
        "Header and footer"
    }
    
    var documentCode: String {
        """
        let viewModels = [1,2,3,4,5].map { (index) -> DSViewModel in
            DSBoxVM(text: index.string())
        }

        let section = viewModels.grid()
        section.header = DSLabelVM(.headline, text: "Header")
        section.footer = DSLabelVM(.headline, text: "Footer")

        show(content: section)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
