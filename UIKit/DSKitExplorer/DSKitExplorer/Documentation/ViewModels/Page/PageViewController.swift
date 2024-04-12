//
//  SegmentViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class PageViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Pages"
        
        var simplePage = action(title: "Default page", description: "Example of default page", icon: "list.bullet")
        simplePage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(PageSimplePageVC())
        }
        
        var insetsPage = action(title: "With insets", description: "Example with insets", icon: "list.bullet")
        insetsPage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(PageSimplePageWithInsetsVC())
        }
        
        show(content: [simplePage, insetsPage].list())
    }
}
