//
//  UIViewExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

public extension UIView {
    
    /// Make a snapShot of whole view.
    ///
    /// - Returns: An snapShop image of view.
    func snapshotImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    class func needLeftToRightAdaptation(_ view: UIView) -> Bool {
        
        if UIView.userInterfaceLayoutDirection(for: view.semanticContentAttribute) == .rightToLeft {
            return true
        }
        
        return false
    }
    
    func dropShadow(shadowOpacity: Float = 0.7) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 4
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale        
    }
}

public extension UIView {
    func clearAllSubViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}

public extension UIView {
    
    class func initFromNib<T: UIView>(bundle: Bundle? = nil) -> T {
        
        func fileIsAvailable(fileName: String, in bundle: Bundle) -> Bool {
            guard bundle.path(forResource: fileName, ofType: "nib") != nil else {
                 return false
            }
            return true
        }
        
        let fileName = String(describing: self)
        
        if fileIsAvailable(fileName: fileName, in: Bundle.module) {
            return Bundle.module.loadNibNamed(fileName, owner: nil, options: nil)?[0] as! T
        }
        
        if fileIsAvailable(fileName: fileName, in: Bundle.main) {
            return  Bundle.main.loadNibNamed(fileName, owner: nil, options: nil)?[0] as! T
        }
        
        if fileIsAvailable(fileName: fileName, in: Bundle.init(for: T.classForCoder())) {
            return Bundle.init(for: T.classForCoder()).loadNibNamed(fileName, owner: nil, options: nil)?[0] as! T
        }
        
        if let bundle = bundle {
            if fileIsAvailable(fileName: fileName, in: bundle) {
                return bundle.loadNibNamed(fileName, owner: nil, options: nil)?[0] as! T
            }
        }

        fatalError("Cant find view for \(T.classForCoder())")
    }
}


extension UIView {
    
    func addCustomSubview(view: UIView?, group: ConstraintGroup) {
        
        guard let view = view else {
            return
        }
        
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateUIEdgeInsets(view: UIView?, insets: UIEdgeInsets, group: ConstraintGroup) {
        
        guard let view = view else {
            return
        }
        
        constrain(self, view, replace: group) { superView, view in
            view.left == superView.left + insets.left
            view.right == superView.right - insets.right
            view.bottom == superView.bottom - insets.bottom ~ UILayoutPriority(999)
            view.top == superView.top + insets.top
        }
    }
    
    var isRTL: Bool {
        effectiveUserInterfaceLayoutDirection == .rightToLeft
    }
}
