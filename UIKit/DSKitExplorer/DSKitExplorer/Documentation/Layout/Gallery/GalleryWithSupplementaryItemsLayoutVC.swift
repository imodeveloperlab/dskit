//
//  GalleryWithSupplementaryItemsLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class GalleryWithSupplementaryItemsLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let viewModels = ["barbershop", "beautysaloon", "flowerstore", "grocerystore"].map { (name) -> DSViewModel in
            
            // Image
            var image = DSImageVM(named: name, height: .absolute(200))
            
            // Label
            let label = DSLabelVM(.subheadline, text: name.capitalized)
            
            let labelSupplementaryView = DSSupplementaryView(view: label, position: .leftBottom)
            
            // Button
            var button = DSButtonVM(title: "Like",
                                    icon: UIImage(systemName: "heart.fill"),
                                    type: .blur(effect: .dark, color: .white))
            
            button.width = .absolute(80)
            button.height = .absolute(40)
            
            let buttonSupplementaryView = DSSupplementaryView(view: button,
                                                              position: .rightTop,
                                                              background: .clear)
            
            image.supplementaryItems = [labelSupplementaryView, buttonSupplementaryView]
            return image
        }
        
        show(content: viewModels.gallery())
        
        // Demo end
    }
}

extension GalleryWithSupplementaryItemsLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Gallery"
    }
    
    var documentSubtitle: String {
        "With supplementary items"
    }
    
    var documentCode: String {
        """
        let texts = ["Languor","Love","Solitude","Epiphany","Quintessential"]

        let viewModels: [DSViewModel] = texts.map { (text) -> DSTextVM in
            DSTextVM(.body, text: text)
        }

        let section = viewModels.list(separator: true, grouped: true)
        let footerText = "Have you ever met someone who embodies all of the characteristics of the city they're from or the career path they've chosen?"
        section.header = DSTextVM(.headline, text: "Header")
        section.footer = DSTextVM(.caption2, text: footerText)
        show(content: section)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct GalleryWithSupplementaryItemsLayoutVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: GalleryWithSupplementaryItemsLayoutVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
