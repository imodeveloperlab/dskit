//
//  ButtonViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ButtonViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Buttons"
        
        // Layout
        var list = action(title: "List", description: "Button", icon: "list.bullet")
        list.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ButtonListVC())
        }
        
        var grid = action(title: "Grid", description: "Button", icon: "rectangle.grid.2x2.fill")
        grid.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ButtonGridVC())
        }
        
        var gallery = action(title: "Gallery", description: "Button", icon: "square.lefthalf.fill")
        gallery.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ButtonGalleryVC())
        }
        
        // Buttons
        var buttons = action(title: "Buttons", description: "Button", icon: "link.circle.fill")
        buttons.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ButtonsVC())
        }
        
        let layoutSection = [list, grid, gallery].list().subheadlineHeader("Layout")
        let buttonsSection = [buttons].list().subheadlineHeader("Buttons")
        
        let sections: [DSSection] = [layoutSection,
                                     buttonsSection]
        show(content: sections)
    }
}
