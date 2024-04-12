//
//  GridSimpleLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GridSimpleLayoutVC: DSViewController {    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentSubtitle
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
        
        show(content: viewModels.grid())
        // Demo end
    }
}

extension GridSimpleLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Gird"
    }
    
    var documentSubtitle: String {
        "Simple layout"
    }
    
    var documentCode: String {
        """
        let viewModels = [1,2,3,4,5].map { (index) -> DSViewModel in
            DSBoxVM(text: index.string())
        }

        show(content: viewModels.grid())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

