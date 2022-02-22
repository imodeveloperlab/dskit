//
//  GalleryFullWidthLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GalleryFullWidthLayoutVC: DSViewController {
    
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
            viewModel.height = .absolute(300)
            viewModel.width = .fractional(1.0)
            viewModel.imageDisplayStyle = .default
            return viewModel
        }
        
        // Full width section
        let section = viewModels.gallery(type: .fullWidth)
        section.zeroTopInset()
        
        show(content: section)
        // Demo end
    }
}

extension GalleryFullWidthLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Gallery"
    }
    
    var documentSubtitle: String {
        "Full width"
    }
    
    var documentCode: String {
        """
        let numbers = [1,2,3,4,5]

        let viewModels = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(300)
            viewModel.width = .fractional(1.0)
            return viewModel
        }

        show(content: viewModels.gallery(type: .fullWidth))
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
