//
//  TypographyViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class TypographyViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Typography"
        
        // Text types
        var textTypes = action(title: "Text types", description: "DSKit typography", icon: "textformat.size")
        textTypes.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyTextTypesVC())
        }
        
        // Layout
        var list = action(title: "List", description: "Show text in lists", icon: "list.bullet")
        list.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyTextListVC())
        }
        
        var grid = action(title: "Grid", description: "Show text in grids", icon: "rectangle.grid.2x2.fill")
        grid.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyTextGridVC())
        }
        
        var gallery = action(title: "Gallery", description: "Show text in galleries", icon: "square.lefthalf.fill")
        gallery.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyTextGalleryVC())
        }
        
        // Text composer
        var textComposerText = action(title: "Text composer", description: "Composer + text view model", icon: "doc.richtext")
        textComposerText.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyTextComposerTextVC())
        }
        
        var textComposerAction = action(title: "Text composer to action", description: "Composer + text action model", icon: "doc.richtext")
        textComposerAction.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyTextComposerActionVC())
        }
        
        // Active text
        var typographyActiveText = action(title: "Active text", description: "Text with links, emails, phone numbers and mentions", icon: "textbox")
        typographyActiveText.didTap { [unowned self] (_ :DSActionVM) in
            self.push(TypographyActiveTextVC())
        }      
        
        let textTypesSection = [textTypes].list().subheadlineHeader("Types")
        let layoutSection = [list, grid, gallery].list().subheadlineHeader("Layout")
        let composerSection = [textComposerText, textComposerAction].list().subheadlineHeader("Composer")
        let activeTextSection = [typographyActiveText].list().subheadlineHeader("Active")
        
        show(content: textTypesSection, composerSection, activeTextSection, layoutSection)
    }
}
