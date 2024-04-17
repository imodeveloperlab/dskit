//
//  TypographyTextComposerVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class TypographyTextComposerTextVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        let composer = DSTextComposer()
        composer.add(type: .title1, text: "Nadir")
        composer.add(type: .subheadline, text: "An astronomical term that's been coopted for colloquial usage, nadir means the lowest point, as in the \"nadir of her popularity.\" Its opposite term, zenith, has a similar appeal.")
        composer.add(price: DSPrice(amount: "100.0", currency: "$"))
        composer.add(price: DSPrice(amount: "50.0", currency: "$"), size: .large)
        composer.add(price: DSPrice(amount: "50.0", currency: "$"), size: .extraLarge)
        
        composer.add(sfSymbol: "staroflife.circle.fill", style: .small, tint: .custom(UIColor.systemYellow))
        composer.add(sfSymbol: "staroflife.circle.fill", style: .medium, tint: .custom(UIColor.systemYellow))
        composer.add(sfSymbol: "staroflife.circle.fill", style: .large, tint: .custom(UIColor.systemYellow))
        
        composer.add(sfSymbol: "moon.stars.fill", style: .custom(size: 60, weight: .light), tint: .custom(UIColor.systemYellow))
        
        composer.add(sfSymbol: "flame.fill", style: .medium, tint: .custom(UIColor.systemRed))
        composer.add(sfSymbol: "star.fill", style: .large)
        composer.add(sfSymbols: ["tray.fill", "star.square", "newspaper.fill", "person.crop.circle.fill.badge.minus", "smoke.fill"], style: .large, tint: .custom(UIColor.systemTeal))
        
        composer.add(rating: 3, maximumValue: 5, positiveSymbol: "star.fill", negativeSymbol: "star", tint: .custom(UIColor.systemYellow))
        
        show(content: composer.textViewModel())
        // Demo end
    }
}

extension TypographyTextComposerTextVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Text"
    }
    
    var documentSubtitle: String {
        "Text composer"
    }
    
    var documentCode: String {
        """
        let composer = DSTextComposer()
        composer.add(type: .title1, text: "Nadir")
        composer.add(type: .subheadline, text: "An astronomical term that's been coopted for colloquial usage, nadir means the lowest point, as in the \"nadir of her popularity.\" Its opposite term, zenith, has a similar appeal.")
        composer.add(price: DSPrice(amount: "100.0", currency: "$"))
        composer.add(price: DSPrice(amount: "50.0", currency: "$"), size: .large)
        composer.add(price: DSPrice(amount: "50.0", currency: "$"), size: .extraLarge)
        
        composer.add(sfSymbol: "staroflife.circle.fill", style: .small, tint: .custom(UIColor.systemYellow))
        composer.add(sfSymbol: "staroflife.circle.fill", style: .medium, tint: .custom(UIColor.systemYellow))
        composer.add(sfSymbol: "staroflife.circle.fill", style: .large, tint: .custom(UIColor.systemYellow))
        
        composer.add(sfSymbol: "moon.stars.fill", style: .custom(size: 60, weight: .light), tint: .custom(UIColor.systemYellow))
        
        composer.add(sfSymbol: "flame.fill", style: .medium, tint: .custom(UIColor.systemRed))
        composer.add(sfSymbol: "star.fill", style: .large)
        composer.add(sfSymbols: ["tray.fill", "star.square", "newspaper.fill", "person.crop.circle.fill.badge.minus", "smoke.fill"], style: .large, tint: .custom(UIColor.systemTeal))
        
        composer.add(rating: 3, maximumValue: 5, positiveSymbol: "star.fill", negativeSymbol: "star", tint: .custom(UIColor.systemYellow))
        
        show(content: composer.textViewModel())
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
