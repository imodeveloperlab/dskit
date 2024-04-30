//
//  GalleryFractional1LayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GalleryFractional1LayoutVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let numbers = [1,2,3,4,5,6,7,8,9,10,11,12]
        
        let viewModels = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(200)
            viewModel.width = .fractional(1.0)
            return viewModel
        }
        
        show(content: viewModels.gallery())
        // Demo end
    }
}

extension GalleryFractional1LayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Gallery"
    }
    
    var documentSubtitle: String {
        "Fractional layout"
    }
    
    var documentCode: String {
        """
        let numbers = [1,2,3,4,5]

        let viewModels = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(200)
            viewModel.width = .fractional(1.0)
            return viewModel
        }

        show(content: viewModels.gallery())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

