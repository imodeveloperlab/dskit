//
//  GalleryFractionalWidthLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GalleryFractionalWidthLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let numbers = [1,2,3,4,5,6]
        let numbers2 = [7,8,9,10,11,12]
        
        let viewModels3 = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(150)
            viewModel.width = .fractional(0.7)
            return viewModel
        }
        
        let viewModels5 = numbers2.map { (index) -> DSViewModel in
            
            var viewModel = DSImageVM(image: UIImage(named: "picture-\(index)"))
            viewModel.height = .absolute(100)
            viewModel.width = .fractional(0.5)
            return viewModel
        }
        
        show(content: [viewModels3.gallery(), viewModels5.gallery()])
        
        // Demo end
    }
}

extension GalleryFractionalWidthLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Gallery"
    }
    
    var documentSubtitle: String {
        "Fractional width layout"
    }
    
    var documentCode: String {
        """
        let numbers = [1,2,3,4,5]

        let viewModels3 = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(150)
            viewModel.width = .fractional(0.7)
            return viewModel
        }

        let viewModels5 = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(50)
            viewModel.width = .fractional(0.5)
            return viewModel
        }

        show(content: [viewModels3.gallery(), viewModels5.gallery()])
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
