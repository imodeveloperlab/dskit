//
//  ActionRightImageVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionRightImageVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Barber Shop
        var barberShop = DSActionVM(title: "Barbershop", subtitle: "themeCornerRadius, scaleAspectFill")
        
        // Right image
        barberShop.rightImage(image: UIImage(named: "barbershop"),
                              style: .themeCornerRadius,
                              size: .size(CGSize(width: 50, height: 50)),
                              contentMode: .scaleAspectFill)
        
        // Barber Saloon
        var beautySaloon = DSActionVM(title: "Beauty Saloon", subtitle: "circle, scaleAspectFill")
        
        // Right image
        beautySaloon.rightImage(image: UIImage(named: "beautysaloon"),
                                style: .circle,
                                size: .size(CGSize(width: 30, height: 30)),
                                contentMode: .scaleAspectFill)
        
        // Flower Store
        var flowerStore = DSActionVM(title: "Flower Store", subtitle: "default, scaleAspectFit")
        
        // Right image
        flowerStore.rightImage(image: UIImage(named: "flowerstore"),
                               style: .default,
                               size: .size(CGSize(width: 70, height: 70)),
                               contentMode: .scaleAspectFit)
        
        // Show
        show(content: barberShop, beautySaloon, flowerStore)
        
        // Demo end
    }
}

extension ActionRightImageVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Right image"
    }
    
    var documentCode: String {
        """
        // Barber Shop
        var barberShop = DSActionVM(title: "Barbershop", subtitle: "themeCornerRadius, scaleAspectFill")
        
        // Right image
        barberShop.rightImage(image: UIImage(named: "barbershop"),
                              style: .themeCornerRadius,
                              size: .size(CGSize(width: 50, height: 50)),
                              contentMode: .scaleAspectFill)
        
        // Barber Saloon
        var beautySaloon = DSActionVM(title: "Beauty Saloon", subtitle: "circle, scaleAspectFill")
        
        // Right image
        beautySaloon.rightImage(image: UIImage(named: "beautysaloon"),
                                style: .circle,
                                size: .size(CGSize(width: 30, height: 30)),
                                contentMode: .scaleAspectFill)
        
        // Flower Store
        var flowerStore = DSActionVM(title: "Flower Store", subtitle: "default, scaleAspectFit")
        
        // Right image
        flowerStore.rightImage(image: UIImage(named: "flowerstore"),
                               style: .default,
                               size: .size(CGSize(width: 70, height: 70)),
                               contentMode: .scaleAspectFit)
        
        // Show
        show(content: barberShop, beautySaloon, flowerStore)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
