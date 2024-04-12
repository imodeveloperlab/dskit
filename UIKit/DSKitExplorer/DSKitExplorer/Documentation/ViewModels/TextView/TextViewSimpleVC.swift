//
//  TextViewSimpleVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextViewSimpleVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        //showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // A
        let textView = DSTextViewVM(text: "A")
        textView.didUpdate = { textVM in
            print(textVM.text ?? "No value")
        }
        
        // B
        let textView2 = DSTextViewVM(text: "B")
        textView2.didUpdate = { textVM in
            print(textVM.text ?? "No value")
        }
        
        // Show page
        self.show(content: textView.list(grouped: true), textView2.list())
        // Demo end
    }
}

extension TextViewSimpleVC: Documentable {
    
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
        // A
        let textView = DSTextViewVM(text: "A")
        textView.didUpdate = { textVM in
            print(textVM.text ?? "No value")
        }
        
        // B
        let textView2 = DSTextViewVM(text: "B")
        textView2.didUpdate = { textVM in
            print(textVM.text ?? "No value")
        }
        
        // Show page
        self.show(content: textView.list(grouped: true), textView2.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
