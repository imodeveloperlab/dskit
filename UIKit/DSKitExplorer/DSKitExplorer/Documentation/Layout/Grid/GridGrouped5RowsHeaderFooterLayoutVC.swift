//
//  GridGrouped5RowsHeaderFooterLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GridGrouped5RowsHeaderFooterLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Map array of number in to DSViewModel array
        let viewModels = [1,2,3,4,5,6,7,8].map { (index) -> DSViewModel in
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(60)
            return viewModel
        }
        
        // Transform viewModels array in to a grid section
        let section = viewModels.grid(columns: 5, grouped: true)
        
        // Set header and footer with text view models
        section.header = DSLabelVM(.headline, text: "Header")
        section.footer = DSLabelVM(.headline, text: "Footer")
        
        // Show content on screen
        show(content: section)
        
        // Demo end
    }
}

extension GridGrouped5RowsHeaderFooterLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Grid"
    }
    
    var documentSubtitle: String {
        "5 columns with header and footer"
    }
    
    var documentCode: String {
        """
        // Map array of number in to DSViewModel array
        let viewModels = [1,2,3,4,5,6,7,8].map { (index) -> DSViewModel in
            DSBoxVM(text: index.string())
        }

        // Transform viewModels array in to a grid section
        let section = viewModels.grid(rows: 5, grouped: true)

        // Set header and footer with text view models
        section.header = DSTextVM(.headline, text: "Header")
        section.footer = DSTextVM(.headline, text: "Footer")

        // Show content on screen
        show(content: section)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
