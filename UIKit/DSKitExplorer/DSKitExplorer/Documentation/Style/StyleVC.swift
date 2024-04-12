//
//  StyleVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class StyleVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Button view model with custom colors
        var button = DSButtonVM(title: "Button")
        
        // Get a copy current appearance colors from secondaryView colors
        var colors = DSAppearance.shared.main.secondaryView
        
        // Change colors
        colors.button.background = UIColor.green
        colors.button.title = UIColor.blue
        
        // Set color style to the button
        button.style.colorStyle = .custom(colors)

        // Image View Model with custom border
        var imageViewModel = DSImageVM(named: "barbershop", height: .absolute(100), displayStyle: .themeCornerRadius)
        
        imageViewModel.style.borderStyle = .custom(width: 5, color: .blue)
        
        // Action with custom corner radius
        var action = DSActionVM(title: "Action")
        action.style.cornerStyle = .custom(3)
        
        // Action with default display style
        var action2 = DSActionVM(title: "Action")
        action2.style.displayStyle = .default
        
        // Action with custom shadow
        var action3 = DSActionVM(title: "Action")
        action3.style.shadowStyle = .small
                
        show(content: [button, imageViewModel, action, action2, action3].list())
        // Demo end
    }
}

extension StyleVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Content Style"
    }
    
    var documentSubtitle: String {
        "Content Style"
    }
    
    var documentCode: String {
        """
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

        let viewModels = texts.map { (text) -> DSViewModel in
            DSTextVM(.body, text: text)
        }

        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct StyleVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: StyleVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
