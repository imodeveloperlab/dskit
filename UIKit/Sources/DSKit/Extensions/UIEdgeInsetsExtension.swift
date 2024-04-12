//
//  UIEdgeInsetsExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 11.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    var height: CGFloat {
        self.top + self.bottom
    }
    
    var width: CGFloat {
        self.left + self.left
    }
}

public extension UIEdgeInsets {
    
    mutating func equalLeftRight(_ newValue: CGFloat) {
        self.left = newValue
        self.right = newValue
    }
    
    mutating func equalTopBottom(_ newValue: CGFloat) {
        self.top = newValue
        self.bottom = newValue
    }
    
    mutating func equalEdges(_ newValue: CGFloat) {
        self.top = newValue
        self.bottom = newValue
        self.left = newValue
        self.right = newValue
    }
}

public extension UIEdgeInsets {
    
    mutating func applyLeftRight(space: CGFloat) {
        self.left = space
        self.right = space
    }
}

extension UIEdgeInsets: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(left)
        hasher.combine(right)
        hasher.combine(top)
        hasher.combine(bottom)
    }
}

extension UIEdgeInsets {
    public func stringHash() -> String {
        return hashValue.string()
    }
}

extension CGSize: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(width)
        hasher.combine(height)
    }
}
