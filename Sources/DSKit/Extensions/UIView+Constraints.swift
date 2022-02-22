//
//  UIView+Constraints.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func clearConstraints() {
        for constraint in self.constraints {
            self.removeConstraint(constraint)
        }
    }
    
    func equalEdgesTo(view: UIView, insets: UIEdgeInsets = .zero) {
        
        self.clearConstraints()
        
        //print(self.constraints)
        //print(view.constraints)
        
        let leftConstraint = view.leftAnchor.constraint(equalTo: self.leftAnchor)
        let topConstraint = view.topAnchor.constraint(equalTo: self.topAnchor)
        let rightConstraint = view.rightAnchor.constraint(equalTo: self.rightAnchor)
        let bottomConstraint = view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        print(leftConstraint.isActive)
        
        leftConstraint.constant = insets.left
        topConstraint.constant = insets.top
        rightConstraint.constant = -insets.right
        bottomConstraint.constant = -insets.bottom
        
        bottomConstraint.priority = UILayoutPriority(rawValue: 999)
        
        leftConstraint.isActive = true
        topConstraint.isActive = true
        rightConstraint.isActive = true
        bottomConstraint.isActive = true
    }
}
