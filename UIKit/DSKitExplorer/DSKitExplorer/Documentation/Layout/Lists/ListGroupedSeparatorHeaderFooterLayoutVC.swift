//
//  ListGroupedSeparatorHeaderFooterLayoutVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListGroupedSeparatorHeaderFooterLayoutVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let texts = ["Languor","Love","Solitude","Epiphany","Quintessential"]
        
        let viewModels: [DSViewModel] = texts.map { (text) -> DSLabelVM in
            DSLabelVM(.body, text: text)
        }
        
        let section = viewModels.list(separator: true, grouped: true)
        let footerText = "Have you ever met someone who embodies all of the characteristics of the city they're from or the career path they've chosen?"
        section.header = DSLabelVM(.headline, text: "Header")
        section.footer = DSLabelVM(.caption2, text: footerText)
        show(content: section)
        
        // Demo end
    }
}

extension ListGroupedSeparatorHeaderFooterLayoutVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "List"
    }
    
    var documentSubtitle: String {
        "Grouped list with separator, header and footer"
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
        // Demo end
    }
}
