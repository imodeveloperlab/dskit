//
//  ShowContentViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class ShowContentViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Display Content"
        
        var content = action(title: "Content", description: "Display view model on the screen", icon: "rectangle.fill.on.rectangle.fill")
        content.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ShowContentVC())
        }
        
        var topContent = action(title: "Top Content", description: "Display view models on top o the screen", icon: "rectangle.fill.on.rectangle.fill")
        topContent.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ShowTopContentVC())
        }
        
        var bottomContent = action(title: "Bottom Content", description: "Display view models on bottom of the screen", icon: "rectangle.fill.on.rectangle.fill")
        bottomContent.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ShowBottomContentVC())
        }
        
        var topBottomContent = action(title: "Top and Bottom Content", description: "Display view models on top and bottom of the screen", icon: "rectangle.fill.on.rectangle.fill")
        topBottomContent.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ShowTopBottomContentVC())
        }
        
        show(content: content, topContent, bottomContent, topBottomContent)
    }
}
