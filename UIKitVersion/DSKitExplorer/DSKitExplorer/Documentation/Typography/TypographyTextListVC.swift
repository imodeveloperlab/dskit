//
//  TypographyTextListVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class TypographyTextListVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let text1 = DSLabelVM(.headline, text: "An astronomical term that's been coopted for colloquial usage")
        let text2 = DSLabelVM(.subheadline, text: "Suffering from a lack of energy? Describe your tiredness—whether it's in your body, your mind.")
        let text3 = DSLabelVM(.caption1, text: "Not to be confused with those furry crepuscular rodents, scintilla means a spark or a trace of something.")
        show(content: [text1, text2, text3].list())
        // Demo end
    }
}

extension TypographyTextListVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Text"
    }
    
    var documentSubtitle: String {
        "List of texts"
    }
    
    var documentCode: String {
        """
        let text1 = DSLabelVM(.headline, text: "An astronomical term that's been coopted for colloquial usage")
        let text2 = DSLabelVM(.subheadline, text: "Suffering from a lack of energy? Describe your tiredness—whether it's in your body, your mind.")
        let text3 = DSLabelVM(.caption1, text: "Not to be confused with those furry crepuscular rodents, scintilla means a spark or a trace of something.")
        show(content: [text1, text2, text3].list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
