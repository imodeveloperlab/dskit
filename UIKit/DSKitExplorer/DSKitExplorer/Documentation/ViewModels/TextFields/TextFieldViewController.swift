//
//  TextFieldViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TextFieldViewController: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Text Field"
        
        var textFields = action(title: "Default", description: "Text Field", icon: "link.circle.fill")
        textFields.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldsVC())
        }
        
        var textFieldsGrouped = action(title: "Grouped", description: "Text Field", icon: "link.circle.fill")
        textFieldsGrouped.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldsGroupedVC())
        }
        
        var textFieldIcons = action(title: "Icons", description: "Text Field", icon: "link.circle.fill")
        textFieldIcons.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldIconsVC())
        }
        
        var textFieldValidData = action(title: "Initial valid data", description: "Text Field", icon: "link.circle.fill")
        textFieldValidData.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldValidDataVC())
        }
        
        var textFieldInvalidData = action(title: "Initial invalid data", description: "Text Field", icon: "link.circle.fill")
        textFieldInvalidData.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldInvalidDataVC())
        }
        
        var textFieldsGroupedGrid = action(title: "Grouped grid", description: "Text Field", icon: "link.circle.fill")
        textFieldsGroupedGrid.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldsGroupedGridVC())
        }
        
        var textFieldsGrid = action(title: "Grid", description: "Text Field", icon: "link.circle.fill")
        textFieldsGrid.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TextFieldsGridVC())
        }
        
        let validationSection = [textFieldValidData,
                                 textFieldInvalidData].list().subheadlineHeader("Validation")
        
        let layoutSection = [textFieldsGrid,
                             textFieldsGroupedGrid].list().subheadlineHeader("Grid")
        
        let textFieldsSection = [textFields,
                                 textFieldsGrouped,
                                 textFieldIcons].list().subheadlineHeader("Text Fields")
        
        show(content: textFieldsSection, layoutSection, validationSection)
    }
}
