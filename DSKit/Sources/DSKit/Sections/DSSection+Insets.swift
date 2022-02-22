//
//  DSSection+Insets.swift
//  DSKit
//
//  Created by Borinschi Ivan on 03.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit

extension DSSection {
    
    @discardableResult public func zeroTopInset() -> Self {
        self.insets.top = 0
        return self
    }
    
    @discardableResult public func interItemTopInset() -> Self {
        self.insets.top = DSAppearance.shared.main.interItemSpacing
        return self
    }
    
    @discardableResult public func topInset(inset: CGFloat) -> Self {
        self.insets.top = inset
        return self
    }
    
    @discardableResult public func zeroBottomInset() -> Self {
        self.insets.bottom = 0
        return self
    }
    
    @discardableResult public func zeroLeftRightInset() -> Self {
        self.insets.left = 0
        self.insets.right = 0
        return self
    }
    
    @discardableResult public func zeroTopBottomInset() -> Self {
        self.insets.top = 0
        self.insets.bottom = 0
        return self
    }
    
    @discardableResult public func doubleMarginLeftRightInsets() -> Self {
        
        let doubleMargin = DSAppearance.shared.main.margins * 2
        self.insets.left = doubleMargin
        self.insets.right = doubleMargin
        return self
    }
}

extension Array where Element == DSSection {
    
    @discardableResult public func zeroTopInset() -> Self {
        
        for section in self {
            section.zeroTopInset()
        }
        
        return self
    }
    
    @discardableResult public func interItemTopInset() -> Self {
        for section in self {
            section.interItemTopInset()
        }
        
        return self
    }
    
    @discardableResult public func topInset(inset: CGFloat) -> Self {
        
        for section in self {
            section.topInset(inset: inset)
        }
        
        return self
    }
    
    @discardableResult public func zeroBottomInset() -> Self {
        for section in self {
            section.zeroBottomInset()
        }
        
        return self
    }
    
    @discardableResult public func zeroLeftRightInset() -> Self {
        for section in self {
            section.zeroLeftRightInset()
        }
        
        return self
    }
    
    @discardableResult public func zeroTopBottomInset() -> Self {
        for section in self {
            section.zeroTopBottomInset()
        }
        
        return self
    }
}
