//
//  BaseNavigationExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension DSBaseViewController {
    
    var prefersLargeTitles: Bool? {
        
        set {
            navigationController?.navigationBar.prefersLargeTitles = newValue ?? false
        }
        get {
            return navigationController?.navigationBar.prefersLargeTitles
        }
    }
    
    /// Set up large titles display mode
    func setUpLargeTitleDisplayMode() {
        
        navigationItem.largeTitleDisplayMode = (self.navigationController?.viewControllers.first == self ? .always : .never)        
        navigationController?.navigationBar.prefersLargeTitles = DSAppearance.shared.main.prefersLargeTitles
        definesPresentationContext = true
        
        if let nav = self.navigationController {
            nav.definesPresentationContext = true
        }
        
        if let tabbar = self.tabBarController {
            tabbar.definesPresentationContext = true
        }
    }
    
    ///Hide navigation bar separator, shadow...
    func hideNavigationBarShadow() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    ///Show navigation bar separator, shadow...
    func showNavigationBarShadow() {
         
        let navColor = DSAppearance.shared.main.navigationBar
        
        var shadowImage = UIImage(color: UIColor.colorOverlay(mainColor: navColor.bar,
                                                              overlayColor: navColor.text,
                                                              opacity: 0.5)!)
        
        shadowImage = shadowImage?.resizeImage(size: CGSize(width: 1, height: 0.5))
        
        self.navigationController?.navigationBar.shadowImage = shadowImage
    }
    
    ///Hide the navigation bar on the this view controller
    func hideNavigationBar(animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    ///Show the navigation bar on other view controllers
    func showNavigationBar(animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
