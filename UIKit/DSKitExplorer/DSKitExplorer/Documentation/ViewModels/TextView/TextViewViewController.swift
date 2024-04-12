//
//  TextViewViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextViewViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "TextView"
        
        var textView = action(title: "TextView", description: "Example of default page", icon: "list.bullet")
        textView.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextViewSimpleVC())
        }
        
        show(content: [textView].list())
    }
}
