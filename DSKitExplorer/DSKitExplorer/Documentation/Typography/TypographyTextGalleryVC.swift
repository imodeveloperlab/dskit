//
//  TypographyTextGalleryVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class TypographyTextGalleryVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let text1 = DSLabelVM(.headline, text: "An astronomical term that's been coopted for colloquial usage")
        var text2 = DSLabelVM(.subheadline, text: "Suffering from a lack of energy? Describe your tiredness—whether it's in your body, your mind.")
        text2.style.displayStyle = .grouped(inSection: false)
        let text3 = DSLabelVM(.caption1, text: "Not to be confused with those furry crepuscular rodents, scintilla means a spark or a trace of something.")
        
        show(content: [text1, text2, text3].gallery())
        // Demo end
    }
}

extension TypographyTextGalleryVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Text"
    }
    
    var documentSubtitle: String {
        "Gallery of texts"
    }
    
    var documentCode: String {
        """
        let text1 = DSLabelVM(.headline, text: "An astronomical term that's been coopted for colloquial usage")
        var text2 = DSLabelVM(.subheadline, text: "Suffering from a lack of energy? Describe your tiredness—whether it's in your body, your mind.")
        text2.displayStyle = .grouped(inSection: false)
        let text3 = DSLabelVM(.caption1, text: "Not to be confused with those furry crepuscular rodents, scintilla means a spark or a trace of something.")

        show(content: [text1, text2, text3].gallery())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
