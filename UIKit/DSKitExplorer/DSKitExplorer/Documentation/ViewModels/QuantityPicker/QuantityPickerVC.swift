//
//  TextViewSimpleVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class QuantityPickerVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        //showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let picker = DSQuantityPickerVM()
        let picker2 = DSQuantityPickerVM()
        
        picker2.width = .absolute(150)
        picker2.height = .absolute(30)
        
        let picker3 = DSQuantityPickerVM()
        picker3.width = .absolute(150)
        picker3.height = .absolute(50)
        
        let picker4 = DSQuantityPickerVM()
        picker4.width = .absolute(150)
        picker4.height = .absolute(40)
        
        // Show page
        self.show(content: [picker, picker2].list(), [picker3, picker4].list(grouped: true))
        
        // Demo end
    }
}

extension QuantityPickerVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Page"
    }
    
    var documentSubtitle: String {
        "Page example"
    }
    
    var documentCode: String {
        """
        // Image
        let image = DSImageVM(named: "glasses", height: .absolute(400))
        
        // Compose text
        let composer = DSTextComposer()
        let spacing = appearance.interItemSpacing
        composer.add(type: .headlineWithSize(40), text: "Discover your best fashion glasses", spacing: spacing, maximumLineHeight: 38)
        composer.add(type: .subheadline, text: "Get all brands at one place. Fill the bag\nwith full joy", spacing: spacing)
        composer.add(type: .headline, text: "Only ")
        composer.add(price: DSPrice(amount: "99.0", regularAmount: "129.00", currency: "$"), size: .extraLarge, newLine: false)
        
        // Space
        let space = DSSpaceVM()
        
        // Page with view models
        var page = DSPageVM(viewModels: [image, space, composer.textViewModel()])
        
        // Show page
        self.show(content: [page].gallery(pageControl: true))
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct QuantityPickerVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: QuantityPickerVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
