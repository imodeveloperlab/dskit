//
//  ActionLeftRoundImageSizeVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Foundation

class ActionLeftImageVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Barbershop
        var barberShop = DSActionVM(title: "Barbershop", subtitle: "themeCornerRadius, scaleAspectFill")
        
        // Left image
        barberShop.leftImage(image: UIImage(named: "barbershop"),
                             style: .themeCornerRadius,
                             size: .size(CGSize(width: 50, height: 50)),
                             contentMode: .scaleAspectFill)
        
        // Beauty Saloon
        var beautysaloon = DSActionVM(title: "Beauty Saloon", subtitle: "circle, scaleAspectFill")
        
        // Left image
        beautysaloon.leftImage(image: UIImage(named: "beautysaloon"),
                               style: .circle,
                               size: .size(CGSize(width: 30, height: 30)),
                               contentMode: .scaleAspectFill)
        
        // Flowers Store
        var flowerstore = DSActionVM(title: "Flower Store", subtitle: "default, scaleAspectFit")
        
        // Left image
        flowerstore.leftImage(image: UIImage(named: "flowerstore"),
                              style: .default,
                              size: .size(CGSize(width: 70, height: 70)),
                              contentMode: .scaleAspectFit)
        
        // Show
        show(content: barberShop, beautysaloon, flowerstore)
        
        // Demo end
    }
}

extension ActionLeftImageVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Action"
    }
    
    var documentSubtitle: String {
        "Different sizes"
    }
    
    var documentCode: String {
        """
        // Barbershop
        var barberShop = DSActionVM(title: "Barbershop", subtitle: "themeCornerRadius, scaleAspectFill")
        
        // Left image
        barberShop.leftImage(image: UIImage(named: "barbershop"),
                             style: .themeCornerRadius,
                             size: .size(CGSize(width: 50, height: 50)),
                             contentMode: .scaleAspectFill)
        
        // Beauty Saloon
        var beautysaloon = DSActionVM(title: "Beauty Saloon", subtitle: "circle, scaleAspectFill")
        
        // Left image
        beautysaloon.leftImage(image: UIImage(named: "beautysaloon"),
                               style: .circle,
                               size: .size(CGSize(width: 30, height: 30)),
                               contentMode: .scaleAspectFill)
        
        // Flowers Store
        var flowerstore = DSActionVM(title: "Flower Store", subtitle: "default, scaleAspectFit")
        
        // Left image
        flowerstore.leftImage(image: UIImage(named: "flowerstore"),
                              style: .default,
                              size: .size(CGSize(width: 70, height: 70)),
                              contentMode: .scaleAspectFit)
        
        // Show
        show(content: barberShop, beautysaloon, flowerstore)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
