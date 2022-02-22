//
//  ImageGalleryVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ImageGalleryVC: DSViewController {
    
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
            DSImageVM(image: UIImage(named: name), height: .absolute(250))
        }
        
        // Show
        show(content: viewModels.gallery())
        
        // Demo end
    }
}

extension ImageGalleryVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Image gallery"
    }
    
    var documentSubtitle: String {
        "Gallery"
    }
    
    var documentCode: String {
        """
        // Images
        let imageNames = ["barbershop", "beautysaloon", "flowerstore", "grocerystore"]
        
        // Map texts into an array  of view models
        let viewModels = imageNames.map { (name) -> DSViewModel in
            DSImageVM(image: UIImage(named: name), height: .absolute(250))
        }
        
        // Show
        show(content: viewModels.gallery())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
