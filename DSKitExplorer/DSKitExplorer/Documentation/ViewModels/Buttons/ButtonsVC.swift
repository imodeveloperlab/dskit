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
        
        // Default left
        let defaultButtonLeftAlignment = DSButtonVM(title: "Default left", textAlignment: .left)
        
        // Light right
        let lightButtonRightAlignment = DSButtonVM(title: "Light right", type: .light, textAlignment: .right)
        
        // Link left
        let linkButtonLeft = DSButtonVM(title: "Link left", type: .link, textAlignment: .left)
        
        // Link right
        let linkButtonRight = DSButtonVM(title: "Link right", type: .link, textAlignment: .right)
        
        // Default button - right image
        var defaultButtonLeftWithRightImage = DSButtonVM(title: "Left text right image",
                                                         icon: UIImage(systemName: "message.fill"),
                                                         textAlignment: .center)

        defaultButtonLeftWithRightImage.imagePosition = .right
        
        // Default button - left image
        var defaultButtonRightWithLeftImage = DSButtonVM(title: "Left image right text",
                                                         icon: UIImage(systemName: "message.fill"),
                                                         textAlignment: .right)
        
        defaultButtonRightWithLeftImage.imagePosition = .left
        
        // Default button - right margin image
        var defaultButtonLeftWithRightMarginImage = DSButtonVM(title: "Left text right margin image",
                                                               icon: UIImage(systemName: "message.fill"),
                                                               textAlignment: .left)
        
        defaultButtonLeftWithRightMarginImage.imagePosition = .rightMargin
        
        // Default button - left margin image
        var defaultButtonRightWithLeftMarginImage = DSButtonVM(title: "Left image right text",
                                                               icon: UIImage(systemName: "message.fill"),
                                                               textAlignment: .right)
        
        defaultButtonRightWithLeftMarginImage.imagePosition = .leftMargin
        
        show(content: defaultButton,
             lightButton,
             linkButton,
             defaultWithIcon,
             lightButtonWithIcon,
             linkButtonWithIcon,
             defaultButtonLeftAlignment,
             lightButtonRightAlignment,
             linkButtonLeft,
             linkButtonRight,
             defaultButtonLeftWithRightImage,
             defaultButtonRightWithLeftImage,
             defaultButtonLeftWithRightMarginImage,
             defaultButtonRightWithLeftMarginImage)
        
        // Demo end
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let lightButtonWithIcon = DSButtonVM(title: "Light", icon: UIImage(systemName: "figure.wave"), type: .light)
        let linkButtonWithIcon = DSButtonVM(title: "Link", icon: UIImage(systemName: "flame.fill"), type: .link)
        
        // Left / Right alignment
        let defaultButtonLeftAlignment = DSButtonVM(title: "Default left", textAlignment: .left)
        let lightButtonRightAlignment = DSButtonVM(title: "Light right", type: .light, textAlignment: .right)
        let linkButtonLeft = DSButtonVM(title: "Link left", type: .link, textAlignment: .left)
        let linkButtonRight = DSButtonVM(title: "Link right", type: .link, textAlignment: .right)
        
        show(content: defaultButton,
             lightButton,
             linkButton,
             defaultWithIcon,
             lightButtonWithIcon,
             linkButtonWithIcon,
             defaultButtonLeftAlignment,
             lightButtonRightAlignment,
             linkButtonLeft,
             linkButtonRight)
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
