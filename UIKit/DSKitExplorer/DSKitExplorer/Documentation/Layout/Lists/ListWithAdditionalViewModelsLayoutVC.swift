//
//  ListWithSupplementaryItemsLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListWithAdditionalViewModelsLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        
        showDemo()
        //showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Image view models
        var imageViewModels = ["barbershop", "beautysaloon"].map { (name) -> DSViewModel in
            
            // Image view
            var image = DSImageVM(image: UIImage(named: name), height: .absolute(50))
            
            // Picker
            let picker = DSQuantityPickerVM()
            picker.height = .absolute(25)
            picker.width = .absolute(100)
            
            // Set picker view as right side view
            image.rightSideView = DSSideView(view: picker)
            
            return image
        }
        
        // Action view models
        let actionViewModels = ["flowerstore", "grocerystore"].map { (name) -> DSViewModel in
            
            // Action
            var action = DSActionVM(title: name)
            action.topImage(image: UIImage(named: name), height: .equalTo(100), contentMode: .scaleAspectFill)
            
            // Picker
            let picker = DSQuantityPickerVM()
            picker.width = .absolute(100)
            picker.height = .absolute(30)
            picker.rightButton(title: "Add",
                               sfSymbolName: "cart.fill.badge.plus",
                               style: .custom(size: 18, weight: .medium)) { 
                
                print("Add to cart")
            }
            
            // Bottom side view
            action.bottomSideView = DSSideView(view: picker)
            return action
        }
        
        imageViewModels.append(contentsOf: actionViewModels)
        show(content: imageViewModels)
        // Demo end
    }
}

extension ListWithAdditionalViewModelsLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "List"
    }
    
    var documentSubtitle: String {
        "List with side view items"
    }
    
    var documentCode: String {
        """
        // Image view models
        var imageViewModels = ["barbershop", "beautysaloon"].map { (name) -> DSViewModel in
            
            var image = DSImageVM(image: UIImage(named: name), height: .absolute(100))
            let label = DSLabelVM(.subheadline, text: name)
            image.supplementaryItems = [label.asSupplementary(position: .leftTop)]
            return image
        }
        
        // Action view models
        let actionViewModels = ["flowerstore", "grocerystore"].map { (name) -> DSViewModel in
            
            var action = DSActionVM(title: name)
            action.topImage(image: UIImage(named: name), height: .equalTo(100), contentMode: .scaleAspectFill)
            
            let label = DSLabelVM(.headlineWithSize(12), text: name.capitalized)
            
            let button = DSButtonVM(sfSymbol: "heart.fill",
                                    type: .blur(effect: .dark, color: .white))
            
            action.supplementaryItems = [label.asSupplementary(position: .leftTop, background: .lightBlur), button.asSupplementary(position: .rightTop, background: .clear)]
            return action
        }
        
        imageViewModels.append(contentsOf: actionViewModels)
        show(content: imageViewModels)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct ListWithAdditionalViewModelsLayoutVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: ListWithAdditionalViewModelsLayoutVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
