//
//  ActionsViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ActionViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Actions"
        
        // Layout
        var list = action(title: "List", description: "Action", icon: "list.bullet")
        list.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionListVC())
        }
        
        var grid = action(title: "Grid", description: "Action", icon: "rectangle.grid.2x2.fill")
        grid.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionGridVC())
        }
        
        var gallery = action(title: "Gallery", description: "Action", icon: "square.lefthalf.fill")
        gallery.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionGalleryVC())
        }
        
        var groupedList = action(title: "Grouped list", description: "Action", icon: "list.bullet")
        groupedList.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionGroupedListVC())
        }
        
        // Left views
        var leftIcon = action(title: "Left Icon", description: "Action", icon: "dot.squareshape.fill")
        leftIcon.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionLeftIconVC())
        }
        
        var actionLeftImage = action(title: "Left image", description: "Action", icon: "photo.fill")
        actionLeftImage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionLeftImageVC())
        }
        
        var leftRoundImage = action(title: "Left round image", description: "Action", icon: "photo.fill")
        leftRoundImage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionLeftRoundImageVC())
        }
        
        var leftRoundImageSize = action(title: "Left round image", description: "With size", icon: "photo.fill")
        leftRoundImageSize.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionLeftRoundImageSizeVC())
        }
        
        // Right views
        var rightIcon = action(title: "Right Icon", description: "Action", icon: "dot.squareshape.fill")
        rightIcon.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionRightIconVC())
        }
        
        var actionRightImage = action(title: "Right image", description: "Action", icon: "photo.fill")
        actionRightImage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionRightImageVC())
        }
        
        var rightRoundImage = action(title: "Right round image", description: "Action", icon: "photo.fill")
        rightRoundImage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionRightRoundImageVC())
        }
        
        var rightRoundImageSize = action(title: "Right round image", description: "With size", icon: "photo.fill")
        rightRoundImageSize.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionRightRoundImageSizeVC())
        }
        
        var actionRightButton = action(title: "Right button", description: "Action", icon: "photo.fill")
        actionRightButton.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionRightButtonVC())
        }
        
        // Top image
        
        var actionTopImage = action(title: "Top Image", description: "Action", icon: "photo.fill")
        actionTopImage.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ActionTopImageVC())
        }
        
        let layoutSection = [list, grid, gallery, groupedList].list().subheadlineHeader("Layout")
        let topImageSection = [actionTopImage].list().subheadlineHeader("Image")
        let leftViewsSection = [leftIcon, actionLeftImage, leftRoundImage, leftRoundImageSize].list().subheadlineHeader("Left views")
        let rightViewsSection = [actionRightButton, rightIcon, actionRightImage, rightRoundImage, rightRoundImageSize].list().subheadlineHeader("Right views")
        
        let sections: [DSSection] = [layoutSection,
                                     topImageSection,
                                     leftViewsSection,
                                     rightViewsSection]
        
        show(content: sections)
        // Demo end
    }
}
