//
//  ShowBottomContentVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class ShowBottomContentVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        //showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]
        
        let viewModels = texts.map { (text) -> DSViewModel in
            DSLabelVM(.body, text: text)
        }
        
        showBottom(content: viewModels.list())
        // Demo end
    }
}

extension ShowBottomContentVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Content"
    }
    
    var documentSubtitle: String {
        "Bottom content"
    }
    
    var documentCode: String {
        """
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

        let viewModels = texts.map { (text) -> DSViewModel in
            DSLabel(.body, text: text)
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

struct ShowBottomContentVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: ShowBottomContentVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}

