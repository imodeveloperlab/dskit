//
//  ImageGalleryHandleDidTapVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ImageGalleryHandleDidTapVC: DSViewController {
    
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
        
        // MARK: - Handle tap on image
        
        // Map texts into an array  of view models
        let viewModels = imageNames.map { (name) -> DSViewModel in
            
            var image = DSImageVM(image: UIImage(named: name), height: .absolute(250))
            
            image.didTap = { (_: DSViewModel) in
                self.show(message: "Did tap on image \(name)")
            }
            
            return image
        }
        
        // MARK: - Handle tap on array of images
        
        // Map texts into an array  of view models
        var viewModels2 = imageNames.map { (name) -> DSViewModel in
            DSImageVM(image: UIImage(named: name), height: .absolute(100))
        }
        
        viewModels2 = viewModels2.didTap { (imageViewModel: DSImageVM) in
            self.show(message: "Did tap on image")
        }
        
        // Show
        show(content: viewModels.gallery(), viewModels2.list())
        
        // Demo end
    }
}

extension ImageGalleryHandleDidTapVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Image gallery"
    }
    
    var documentSubtitle: String {
        "Handle did tap on DSImageVM view models"
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
