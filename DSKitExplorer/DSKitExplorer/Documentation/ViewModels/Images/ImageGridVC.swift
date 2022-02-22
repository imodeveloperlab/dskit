//
//  ImageGridVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ImageGridVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Images
        let imageNames = ["barbershop", "beautysaloon", "flowerstore", "grocerystore"]
        
        // Map texts into an array  of view models
        let viewModels = imageNames.map { (name) -> DSViewModel in
            DSImageVM(image: UIImage(named: name), height: .absolute(100))
        }
        
        // Show
        show(content: viewModels.grid())
        
        // Demo end
    }
}

extension ImageGridVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Image grid"
    }
    
    var documentSubtitle: String {
        "Grid"
    }
    
    var documentCode: String {
        """
        // Images
        let imageNames = ["barbershop", "beautysaloon", "flowerstore", "grocerystore"]
        
        // Map texts into an array  of view models
        let viewModels = imageNames.map { (name) -> DSViewModel in
            DSImageVM(image: UIImage(named: name), height: .absolute(100))
        }
        
        // Show
        show(content: viewModels.grid())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
