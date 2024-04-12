//
//  TypographyTextTypesVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class TypographyTextTypesVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let title1 = DSLabelVM(.title1, text: "Title 1")
        let title2 = DSLabelVM(.title2, text: "Title 2")
        let title3 = DSLabelVM(.title3, text: "Title 3")
        let headline = DSLabelVM(.headline, text: "Headline")
        let subheadline = DSLabelVM(.subheadline, text: "Subheadline")
        let body = DSLabelVM(.body, text: "Body")
        let callout = DSLabelVM(.callout, text: "Callout")
        let caption1 = DSLabelVM(.caption1, text: "Caption 1")
        let caption2 = DSLabelVM(.caption2, text: "Caption 2")
        let footnote = DSLabelVM(.footnote, text: "Footnote")
        show(content: [title1, title2, title3, headline, subheadline, body, callout, caption1, caption2, footnote])
        // Demo end
    }
}

extension TypographyTextTypesVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Text"
    }
    
    var documentSubtitle: String {
        "Typography"
    }
    
    var documentCode: String {
        """
        let title1 = DSLabelVM(.title1, text: "Title 1")
        let title2 = DSLabelVM(.title2, text: "Title 2")
        let title3 = DSLabelVM(.title3, text: "Title 3")
        let headline = DSLabelVM(.headline, text: "Headline")
        let subheadline = DSLabelVM(.subheadline, text: "Subheadline")
        let body = DSLabelVM(.body, text: "Body")
        let callout = DSLabelVM(.callout, text: "Callout")
        let caption1 = DSLabelVM(.caption1, text: "Caption 1")
        let caption2 = DSLabelVM(.caption2, text: "Caption 2")
        let footnote = DSLabelVM(.footnote, text: "Footnote")
        show(content: [title1, title2, title3, headline, subheadline, body, callout, caption1, caption2, footnote])
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
