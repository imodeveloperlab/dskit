//
//  GalleryAbsoluteWidthLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GalleryAbsoluteWidthLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let viewModels = [1,2,3,4,5,6,7,8,9,10,11,12].map { (index) -> DSViewModel in
            
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(150)
            viewModel.width = .absolute(150)
            return viewModel
        }
        
        show(content: viewModels.gallery())
        // Demo end
    }
}

extension GalleryAbsoluteWidthLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Gallery"
    }
    
    var documentSubtitle: String {
        "Absolute width layout"
    }
    
    var documentCode: String {
        """
        let viewModels = [1,2,3,4,5].map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(150)
            viewModel.width = .absolute(150)
            return viewModel
        }

        show(content: viewModels.gallery())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
