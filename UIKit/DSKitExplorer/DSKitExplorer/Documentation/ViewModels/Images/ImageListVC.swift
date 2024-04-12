//
//  ImageListVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ImageListVC: DSViewController {
    
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
        show(content: viewModels.list())
        // Demo end
    }
}

extension ImageListVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Image list"
    }
    
    var documentSubtitle: String {
        "List"
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
        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
