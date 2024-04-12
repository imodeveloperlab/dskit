//
//  ActionRightRoundImageVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionRightRoundImageVC: DSViewController {
    
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
        
        // Map data into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            
            // Action
            var action = DSActionVM(title: text.key)
            let image = UIImage(named: text.value)
            
            // Set right round image
            action.rightRoundImage(image: image)
            return action
        }
        
        // Show
        show(content: actions)
        // Demo end
    }
}

extension ActionRightRoundImageVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Right round image"
    }
    
    var documentCode: String {
        """
        // Data
        let data = ["Barbershop": "barbershop", "Beauty Saloon": "beautysaloon", "Flower Store": "flowerstore"]
        let sortedData = data.sorted(by: { $0 < $1 })
        
        // Map data into an array of view models
        let actions = sortedData.map { text -> DSViewModel in
            
            // Action
            var action = DSActionVM(title: text.key)
            let image = UIImage(named: text.value)
            
            // Set right round image
            action.rightRoundImage(image: image)
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
