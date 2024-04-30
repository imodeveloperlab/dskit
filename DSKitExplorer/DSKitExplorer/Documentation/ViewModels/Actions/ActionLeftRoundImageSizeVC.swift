//
//  ActionLeftRoundImageSizeVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionLeftRoundImageSizeVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Data
        let data = ["Barbershop": "barbershop", "Beauty Saloon": "beautysaloon", "Flower Store": "flowerstore"]
        let sortedData = data.sorted(by: { $0 < $1 })
        
        // Default image size
        var widthHeight = 40
        
        // Map data into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            
            // Action with title and subtitle
            var action = DSActionVM(title: text.key, subtitle: "Image name: \(text.value)")
            
            // Image
            let image = UIImage(named: text.value)
            
            // Set left round image
            action.leftRoundImage(image: image, size: CGSize(width: widthHeight, height: widthHeight))
            
            // Increase image size for each view model
            widthHeight += 15
            
            return action
        }
        
        // Show
        show(content: actions)
        
        // Demo end
    }
}

extension ActionLeftRoundImageSizeVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Left round image sizes"
    }
    
    var documentCode: String {
        """
        // Data
        let data = ["Barbershop": "barbershop", "Beauty Saloon": "beautysaloon", "Flower Store": "flowerstore"]
        let sortedData = data.sorted(by: { $0 < $1 })
        
        // Default image size
        var widthHeight = 40
        
        // Map data into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            
            // Action with title and subtitle
            var action = DSActionVM(title: text.key, subtitle: "Image name: \\(text.value)")
            
            // Image
            let image = UIImage(named: text.value)
            
            // Set left round image
            action.leftRoundImage(image: image, size: CGSize(width: widthHeight, height: widthHeight))
            
            // Increase image size for each view model
            widthHeight += 15
            
            return action
        }
        
        // Show
        show(content: actions)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
