//
//  TypographyTextComposerActionVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class TypographyTextComposerActionVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let nadir = DSTextComposer()
        nadir.add(type: .title1, text: "Nadir")
        nadir.add(type: .subheadline, text: "An astronomical term that's been coopted for colloquial usage.")
        
        let lassitude = DSTextComposer()
        lassitude.add(type: .headline, text: "Lassitude")
        lassitude.add(type: .subheadline, text: "Suffering from a lack of energy? Describe your tiredness—whether it's in your body, your mind.")
        
        var nadirAction = nadir.actionViewModel()
        nadirAction.rightArrow()
        
        var lassitudeAction = lassitude.actionViewModel()
        lassitudeAction.rightImage(named: "flowerstore")
        show(content: nadirAction, lassitudeAction)
        // Demo end
    }
}

extension TypographyTextComposerActionVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Text"
    }
    
    var documentSubtitle: String {
        "Composer transfrom to action"
    }
    
    var documentCode: String {
        """
        let nadir = DSTextComposer()
        nadir.add(type: .title1, text: "Nadir")
        nadir.add(type: .subheadline, text: "An astronomical term that's been coopted for colloquial usage.")
        
        let lassitude = DSTextComposer()
        lassitude.add(type: .headline, text: "Lassitude")
        lassitude.add(type: .subheadline, text: "Suffering from a lack of energy? Describe your tiredness—whether it's in your body, your mind.")
        
        var nadirAction = nadir.actionViewModel()
        nadirAction.rightArrow()
        
        var lassitudeAction = lassitude.actionViewModel()
        lassitudeAction.rightImage(named: "flowerstore")
        show(content: nadirAction, lassitudeAction)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
