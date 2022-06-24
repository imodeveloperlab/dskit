//
//  ButtonsVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ButtonsVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        //showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Default button style
        var defaultButton = DSButtonVM(title: "Default")
        defaultButton.didTap { [unowned self] (button: DSButtonVM) in
            self.show(message: "Did dap on Default button", timeOut: 1)
        }
        
        // Light button style
        var lightButton = DSButtonVM(title: "Light", type: .light)
        lightButton.didTap { [unowned self] (button: DSButtonVM) in
            self.show(message: "Did dap on light button", timeOut: 1)
        }
        
        // Link button style
        var linkButton = DSButtonVM(title: "Link", type: .link)
        linkButton.didTap { [unowned self] (button: DSButtonVM) in
            self.show(message: "Did dap on link button")
        }
        
        // Buttons with icons
        let defaultWithIcon = DSButtonVM(title: "Default", icon: UIImage(systemName: "message.fill"))
        var lightButtonWithIcon = DSButtonVM(title: "Light", icon: UIImage(systemName: "figure.wave"), type: .light)
        lightButtonWithIcon.imagePosition = .right
        
        // Link with icon
        let linkButtonWithIcon = DSButtonVM(title: "Link", icon: UIImage(systemName: "flame.fill"), type: .link)
                
        // Light right
        let lightButtonRightAlignment = DSButtonVM(title: "Light right", type: .light, textAlignment: .right)
        
        // Link left
        let linkButtonLeft = DSButtonVM(title: "Link left", type: .link, textAlignment: .left)
        
        // Link right
        let linkButtonRight = DSButtonVM(title: "Link right", type: .link, textAlignment: .right)
        
        // Default buttons
        let defaultButtonWithLeftText = DSButtonVM(title: "Default left", textAlignment: .left)
        let defaultButtonWithCenterText = DSButtonVM(title: "Default center", textAlignment: .center)
        let defaultButtonWithRightText = DSButtonVM(title: "Default right", textAlignment: .right)
        
        show(content:
             defaultButton,
             lightButton,
             linkButton,
             defaultWithIcon,
             lightButtonWithIcon,
             linkButtonWithIcon,
             lightButtonRightAlignment,
             linkButtonLeft,
             linkButtonRight,
             defaultButtonWithLeftText,
             defaultButtonWithCenterText,
             defaultButtonWithRightText,
             defaultButtonItem("Left text right image", textAlignment: .left, imagePosition: .right),
             defaultButtonItem("Left text right margin image", textAlignment: .left, imagePosition: .rightMargin),
             defaultButtonItem("Center text right image", textAlignment: .center, imagePosition: .right),
             defaultButtonItem("Center text right margin image", textAlignment: .center, imagePosition: .rightMargin),
             defaultButtonItem("Right text right image", textAlignment: .right, imagePosition: .right),
             defaultButtonItem("Right text right margin image", textAlignment: .right, imagePosition: .rightMargin),
             defaultButtonItem("Right text left image", textAlignment: .right, imagePosition: .left),
             defaultButtonItem("Right text left margin image", textAlignment: .right, imagePosition: .leftMargin),
             defaultButtonItem("Center text left image", textAlignment: .center, imagePosition: .left),
             defaultButtonItem("Center text left margin image", textAlignment: .center, imagePosition: .leftMargin),
             defaultButtonItem("Left text left image", textAlignment: .left, imagePosition: .left),
             defaultButtonItem("Left text left margin image", textAlignment: .left, imagePosition: .leftMargin))
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension ButtonsVC {
    func defaultButtonItem(_ title: String, textAlignment: NSTextAlignment, imagePosition: DSButtonVM.DSButtonVMImagePosition) -> DSButtonVM {
        var button = DSButtonVM(title: title,
                                icon: UIImage(systemName: "message.fill"),
                                textAlignment: textAlignment)
        
        button.imagePosition = imagePosition
        
        return button
    }
}

extension ButtonsVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Button"
    }
    
    var documentSubtitle: String {
        "Buttons"
    }
    
    var documentCode: String {
        """
        // Default button style
        var defaultButton = DSButtonVM(title: "Default")
        defaultButton.didTap { [unowned self] (button: DSButtonVM) in
            self.show(message: "Did dap on Default button", timeOut: 1)
        }
        
        // Light button style
        var lightButton = DSButtonVM(title: "Light", type: .light)
        lightButton.didTap { [unowned self] (button: DSButtonVM) in
            self.show(message: "Did dap on light button", timeOut: 1)
        }
        
        // Link button style
        var linkButton = DSButtonVM(title: "Link", type: .link)
        linkButton.didTap { [unowned self] (button: DSButtonVM) in
            self.show(message: "Did dap on link button")
        }
        
        // Buttons with icons
        let defaultWithIcon = DSButtonVM(title: "Default", icon: UIImage(systemName: "message.fill"))
        var lightButtonWithIcon = DSButtonVM(title: "Light", icon: UIImage(systemName: "figure.wave"), type: .light)
        lightButtonWithIcon.imagePosition = .right
        
        // Link with icon
        let linkButtonWithIcon = DSButtonVM(title: "Link", icon: UIImage(systemName: "flame.fill"), type: .link)
        
        // Light right
        let lightButtonRightAlignment = DSButtonVM(title: "Light right", type: .light, textAlignment: .right)
        
        // Link left
        let linkButtonLeft = DSButtonVM(title: "Link left", type: .link, textAlignment: .left)
        
        // Link right
        let linkButtonRight = DSButtonVM(title: "Link right", type: .link, textAlignment: .right)
        
        // Default buttons
        let defaultButtonWithLeftText = DSButtonVM(title: "Default left", textAlignment: .left)
        let defaultButtonWithCenterText = DSButtonVM(title: "Default center", textAlignment: .center)
        let defaultButtonWithRightText = DSButtonVM(title: "Default right", textAlignment: .right)
                
        show(content:
            defaultButton,
            lightButton,
            linkButton,
            defaultWithIcon,
            lightButtonWithIcon,
            linkButtonWithIcon,
            lightButtonRightAlignment,
            linkButtonLeft,
            linkButtonRight,
            defaultButtonWithLeftText,
            defaultButtonWithCenterText,
            defaultButtonWithRightText,
            defaultButtonItem("Left text right image", textAlignment: .left, imagePosition: .right),
            defaultButtonItem("Left text right margin image", textAlignment: .left, imagePosition: .rightMargin),
            defaultButtonItem("Center text right image", textAlignment: .center, imagePosition: .right),
            defaultButtonItem("Center text right margin image", textAlignment: .center, imagePosition: .rightMargin),
            defaultButtonItem("Right text right image", textAlignment: .right, imagePosition: .right),
            defaultButtonItem("Right text right margin image", textAlignment: .right, imagePosition: .rightMargin),
            defaultButtonItem("Right text left image", textAlignment: .right, imagePosition: .left),
            defaultButtonItem("Right text left margin image", textAlignment: .right, imagePosition: .leftMargin),
            defaultButtonItem("Center text left image", textAlignment: .center, imagePosition: .left),
            defaultButtonItem("Center text left margin image", textAlignment: .center, imagePosition: .leftMargin),
            defaultButtonItem("Left text left image", textAlignment: .left, imagePosition: .left),
            defaultButtonItem("Left text left margin image", textAlignment: .left, imagePosition: .leftMargin))
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct ButtonsVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: ButtonsVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
