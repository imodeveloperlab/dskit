//
//  ActionLeftIconVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionTopImageVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Barber shop
        let barbershop = DSTextComposer()
        barbershop.add(type: .headline, text: "Barber Shop")
        barbershop.add(type: .subheadline, text: "Subheadline text")
        var barbershopAction = DSActionVM(composer: barbershop)
        
        // Set top image
        barbershopAction.topImage(image: UIImage(named: "barbershop"), height: .equalTo(50))
        
        // Beauty saloon
        var beautySaloonAction = DSActionVM(title: "Beauty Saloon")
        
        // Set top image
        beautySaloonAction.topImage(image: UIImage(named: "beautysaloon"), height: .unknown)
        beautySaloonAction.height = .absolute(150)
        
        // Beauty saloon
        var flowerStoreAction = DSActionVM(title: "Flower Store", subtitle: "Best flower store in town")
        
        // Set top image
        flowerStoreAction.topImage(image: UIImage(named: "flowerstore"), height: .equalTo(200))
        
        // Right button
        flowerStoreAction.rightButton(title: "More details", sfSymbolName: "leaf.fill", style: .small) { [unowned self] in
            self.show(message: "Did tap on more details")
        }
        
        // Show
        show(content: barbershopAction, beautySaloonAction, flowerStoreAction)
        
        // Demo end
    }
}

extension ActionTopImageVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Top image"
    }
    
    var documentCode: String {
        """
        // Barber shop
        let barbershop = DSTextComposer()
        barbershop.add(type: .headline, text: "Barber Shop")
        barbershop.add(type: .subheadline, text: "Subheadline text")
        var barbershopAction = DSActionVM(composer: barbershop)
        
        // Set top image
        barbershopAction.topImage(image: UIImage(named: "barbershop"), height: .equalTo(50))
        
        // Beauty saloon
        var beautySaloonAction = DSActionVM(title: "Beauty Saloon")
        
        // Set top image
        beautySaloonAction.topImage(image: UIImage(named: "beautysaloon"), height: .unknown)
        beautySaloonAction.height = .absolute(150)
        
        // Beauty saloon
        var flowerStoreAction = DSActionVM(title: "Flower Store", subtitle: "Best flower store in town")
        
        // Set top image
        flowerStoreAction.topImage(image: UIImage(named: "flowerstore"), height: .equalTo(200))
        
        // Right button
        flowerStoreAction.rightButton(title: "More details", sfSymbolName: "leaf.fill", style: .small) { [unowned self] in
            self.show(message: "Did tap on more details")
        }
        
        // Show
        show(content: barbershopAction, beautySaloonAction, flowerStoreAction)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

