//
//  GalleryPageControlFractional1LayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GalleryPageControlFractional1LayoutVC: DSViewController {
    
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
            viewModel.height = .absolute(250)
            viewModel.width = .fractional(1.0)
            return viewModel
        }
        
        let pageControl = DSPageControlVM(type: .viewModels(viewModels))
        let section = pageControl.list().zeroLeftRightInset()
        section.zeroLeftRightInset()
        
        show(content: section)
        
        // Demo end
    }
}

extension GalleryPageControlFractional1LayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Gallery"
    }
    
    var documentSubtitle: String {
        "With page control and fractional width 1.0"
    }
    
    var documentCode: String {
        """
        let numbers = [1,2,3,4]

        let viewModels = numbers.map { (index) -> DSViewModel in
            
            var viewModel = DSBoxVM(text: index.string())
            viewModel.height = .absolute(100)
            viewModel.width = .fractional(1.0)
            return viewModel
        }

        let section = viewModels.gallery(pageControl: true)
        section.header = DSLabelVM(.headline, text: "Fractional 1.0")

        show(content: section)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
