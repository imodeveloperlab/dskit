//
//  UIEdgeInsets+Add.swift
//  DSKit
//
//  Created by Borinschi Ivan on 31.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    /// Add number to all edges and return new UIEdgeInsets
    /// - Parameter number: CGFloat
    /// - Returns: UIEdgeInsets
    func add(_ number: CGFloat) -> UIEdgeInsets {
        var insets = self
        insets.top += number
        insets.bottom += number
        insets.left += number
        insets.right += number
        return insets
    }
}
