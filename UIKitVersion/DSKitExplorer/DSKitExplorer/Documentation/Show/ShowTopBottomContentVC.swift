//
//  ShowTopBottomContentVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class ShowTopBottomContentVC: DSViewController {
    
    var showCenter: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
    }
    
    func showDemo() {
        
        // Demo begin
        
        var showBottom = DSButtonVM(title: "Show Bottom")
        showBottom.didTap { [unowned self] (_ :DSButtonVM) in
            self.showBottom()
        }
        
        var hideBottom = DSButtonVM(title: "Hide Bottom")
        hideBottom.didTap { [unowned self] (_ :DSButtonVM) in
            self.hideBottom()
        }
        
        var showTop = DSButtonVM(title: "Show Top")
        showTop.didTap { [unowned self] (_ :DSButtonVM) in
            self.showTop()
        }
        
        var hideTop = DSButtonVM(title: "Hide Top")
        hideTop.didTap { [unowned self] (_ :DSButtonVM) in
            self.hideTop()
        }
        
        var showCenter = DSButtonVM(title: "Show Center")
        showCenter.didTap { [unowned self] (_ :DSButtonVM) in
            self.showCenter = true
            self.showDemo()
        }
        
        var hideCenter = DSButtonVM(title: "Hide Center")
        hideCenter.didTap { [unowned self] (_ :DSButtonVM) in
            self.showCenter = false
            self.showDemo()
        }
        
        // Texts
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir","Petrichor"]
        let textViewModels = texts.map { (text) -> DSViewModel in
            DSLabelVM(.body, text: text)
        }
        
        var sections = [DSSection]()
        
        let buttonsSection = [showBottom,
                              hideBottom,
                              showTop,
                              hideTop,
                              showCenter,
                              hideCenter].grid(identifier: "TopButtons")
        
        sections.append(buttonsSection)        
        
        let textsSection = textViewModels.list(grouped: true, identifier: "List")
        sections.append(textsSection)
        
        if self.showCenter {
            let imageSection = DSImageVM(named: "barbershop", height: .absolute(300)).list(identifier: "BarbeshopImage")
            sections.append(imageSection)
        }
        
        show(content: sections)
        
        // Demo end
    }
    
    func showBottom() {
        
        // Buttons
        let buttons = ["Login", "Register", "Next"]
        let buttonsViewModels = buttons.map { (text) -> DSViewModel in
            DSButtonVM(title: text)
        }
        
        showBottom(content: buttonsViewModels.grid(columns: 3))
    }
    
    func hideBottom() {
        
        hideBottomContent()
        
    }
    
    func showTop() {
        
        let composer = DSTextComposer()
        composer.add(type: .headline, text: "User profile")
        composer.add(type: .subheadline, text: "Here will be user profile description")
        
        let profile = DSActionVM(composer: composer)
        
        showTop(content: profile.list())
        
    }
    
    func hideTop() {
        
        hideTopContent()
        
    }
}

extension ShowTopBottomContentVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Content"
    }
    
    var documentSubtitle: String {
        "Show content in all positions int the same time"
    }
    
    var documentCode: String {
        """
        let texts = ["Petrichor","Sumptuous","Angst","Aesthete","Nadir"]

        let viewModels = texts.map { (text) -> DSViewModel in
            DSLabel(.body, text: text)
        }

        show(content: viewModels.list())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct ShowTopBottomContentVCPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: ShowTopBottomContentVC(), DSKitAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
