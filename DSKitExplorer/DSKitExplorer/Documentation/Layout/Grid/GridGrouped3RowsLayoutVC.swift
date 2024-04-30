//
//  GridGrouped3RowsLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GridGrouped3RowsLayoutVC: DSViewController {
    
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
            viewModel.height = .absolute(100)
            return viewModel

        }
        
        show(content: viewModels.grid(columns: 3, grouped: true))
        // Demo end
    }
}

extension GridGrouped3RowsLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Grid"
    }
    
    var documentSubtitle: String {
        "3 columns layout"
    }
    
    var documentCode: String {
        """
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

        let viewModels = texts.map { (text) -> DSViewModel in
            DSTextVM(.body, text: text)
        }

        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

fileprivate let code = """
let viewModels = [1,2,3,4,5].map { (index) -> DSViewModel in
    DSBoxVM(text: index.string())
}

show(content: viewModels.grid(rows: 3, grouped: true))
"""
