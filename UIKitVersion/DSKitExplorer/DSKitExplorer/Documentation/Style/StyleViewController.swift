//
//  StyleViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class StyleViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Content Style"
        
        var style = action(title: "Style", description: "View models style", icon: "rectangle.fill.on.rectangle.fill")
        style.didTap { [unowned self] (_ :DSActionVM) in
            self.push(StyleVC())
        }
               
        show(content: style)
    }
}
