//
//  ImagesVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ImagesVC: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Barber Shop
        let barberShop = DSImageVM(named: "barbershop",
                                   height: .absolute(100),
                                   displayStyle: .circle)
        
        // Beauty Saloon
        let beautySaloon = DSImageVM(named: "beautysaloon",
                                     height: .absolute(100),
                                     displayStyle: .themeCornerRadius)
        
        // Flower Saloon
        let flowerStore = DSImageVM(named: "flowerstore",
                                    height: .absolute(100),
                                    displayStyle: .default,
                                    contentMode: .scaleAspectFit)
        
        // Show
        show(content: barberShop, beautySaloon, flowerStore)
        
        // Demo end
    }
}

extension ImagesVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Images"
    }
    
    var documentSubtitle: String {
        "Images"
    }
    
    var documentCode: String {
        """
        // Barber Shop
        let barberShop = DSImageVM(named: "barbershop",
                                   height: .absolute(100),
                                   displayStyle: .circle)
        
        // Beauty Saloon
        let beautySaloon = DSImageVM(named: "beautysaloon",
                                     height: .absolute(100),
                                     displayStyle: .themeCornerRadius)
        
        // Flower Saloon
        let flowerStore = DSImageVM(named: "flowerstore",
                                    height: .absolute(100),
                                    displayStyle: .default,
                                    contentMode: .scaleAspectFit)
        
        // Show
        show(content: barberShop, beautySaloon, flowerStore)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
