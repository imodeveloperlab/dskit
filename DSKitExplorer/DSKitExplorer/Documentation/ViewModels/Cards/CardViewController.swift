//
//  CardViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class CardViewController: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Text composer
        let composer = DSTextComposer(alignment: .left)
        composer.add(type: .text(font: .headlineWithSize(18), color: .white), text: "John Doe")
        composer.add(type: .text(font: .headlineWithSize(24), color: .white), text: "0006 5236 1689 9521")
        composer.add(type: .text(font: .subheadline, color: .white), text: "Exp: 24/23")
        
        // Credit Card
        let creditCard = DSCardVM(composer: composer,
                                  textPosition: .bottom,
                                  backgroundImage: .image(image: UIImage(named: "visa-card-bg")))
        
        // Text composer 2
        let composer2 = DSTextComposer(alignment: .right)
        composer2.add(type: .text(font: .headlineWithSize(18), color: .white), text: "Bonus Card")
        composer2.add(type: .text(font: .headlineWithSize(24), color: .white), text: "0006 5236 1689 9521")
        composer2.add(type: .text(font: .subheadline, color: .white), text: "Discount: 10%, Points 0, Cash Back 5%")
        composer2.add(price: DSPrice(amount: "50", currency: "$", discountBadge: "BONUS"), size: .large)
        
        // Bonus Card
        var bonusCard = DSCardVM(composer: composer2, textPosition: .bottom,
                                 backgroundImage: .imageURL(url: URL(string: "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?cs=srgb&dl=pexels-freestocksorg-291762.jpg&fm=jpg")))
        
        // Bonus Card gradient
        bonusCard.gradientTopColor = UIColor.black.withAlphaComponent(0.1)
        bonusCard.gradientBottomColor = DSColor.color(light: UIColor.black.withAlphaComponent(1.0), dark: UIColor.black.withAlphaComponent(0.7))
        
        // Show
        show(content: creditCard, bonusCard)
        // Demo end
    }
}

extension CardViewController: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Card"
    }
    
    var documentSubtitle: String {
        "Card example"
    }
    
    var documentCode: String {
        """
        // Text composer
        let composer = DSTextComposer(alignment: .left)
        composer.add(type: .text(font: .headlineWithSize(18), color: .white), text: "John Doe")
        composer.add(type: .text(font: .headlineWithSize(24), color: .white), text: "0006 5236 1689 9521")
        composer.add(type: .text(font: .subheadline, color: .white), text: "Exp: 24/23")
        
        // Credit Card
        let creditCard = DSCardVM(composer: composer,
                                  textPosition: .bottom,
                                  backgroundImage: .image(image: UIImage(named: "visa-card-bg")))
        
        // Text composer 2
        let composer2 = DSTextComposer(alignment: .right)
        composer2.add(type: .text(font: .headlineWithSize(18), color: .white), text: "Bonus Card")
        composer2.add(type: .text(font: .headlineWithSize(24), color: .white), text: "0006 5236 1689 9521")
        composer2.add(type: .text(font: .subheadline, color: .white), text: "Discount: 10%, Points 0, Cash Back 5%")
        composer2.add(price: DSPrice(amount: "50", currency: "$", discountBadge: "BONUS"), size: .large)
        
        // Bonus Card
        var bonusCard = DSCardVM(composer: composer2, textPosition: .bottom,
                                 backgroundImage: .imageURL(url: URL(string: "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?cs=srgb&dl=pexels-freestocksorg-291762.jpg&fm=jpg")))
        
        // Bonus Card gradient
        bonusCard.gradientTopColor = UIColor.black.withAlphaComponent(0.1)
        bonusCard.gradientBottomColor = DSColor.color(light: UIColor.black.withAlphaComponent(1.0), dark: UIColor.black.withAlphaComponent(0.7))
        
        // Show
        show(content: creditCard, bonusCard)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

// MARK: - SwiftUI Preview

import SwiftUI

struct CardViewControllerPreview: PreviewProvider {
    
    static var previews: some View {
        Group {
            PreviewContainer(VC: CardViewController(), PeachAppearance()).edgesIgnoringSafeArea(.all)
        }
    }
}
