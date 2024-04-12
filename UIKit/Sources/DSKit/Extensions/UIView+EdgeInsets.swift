//
//  UIView+Margins.swift
//  DSKit
//
//  Created by Borinschi Ivan on 04.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import Cartography

extension UIView {
        
    /// Place self in a subview and add insets from sides
    /// - Parameter insets: UIEdgeInsets
    /// - Returns: Subview with insets
    func subViewWith(insets: UIEdgeInsets) -> UIView {
        
        let holderView = UIView()
        holderView.addSubview(self)
        
        constrain(self, holderView) { view, holderView in
            view.left == holderView.left + insets.left
            view.top == holderView.top + insets.top
            view.bottom == holderView.bottom - insets.bottom
            view.right == holderView.right - insets.right
        }
        
        return holderView
    }
}
