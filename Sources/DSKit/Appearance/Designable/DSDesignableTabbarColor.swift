//
//  DSDesignableTabbarColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Tabbar colors
public struct DSDesignableTabbarColor {
    
    /// Init tabbar colors
    /// - Parameters:
    ///   - barTint: UIColor
    ///   - itemTint: UIColor
    ///   - unselectedItemTint: UIColor
    ///   - badge: UIColor
    ///   - translucent: Bool
    public init(barTint: UIColor,
                itemTint: UIColor,
                unselectedItemTint: UIColor,
                badge: UIColor,
                translucent: Bool = false) {
        
        self.barTint = barTint
        self.itemTint = itemTint
        self.unselectedItemTint = unselectedItemTint
        self.badge = badge
        self.translucent = translucent
    }
    
    /// Bar tint color
    public var barTint: UIColor
    
    /// Item tint color
    public var itemTint: UIColor
    
    /// Unselected item tint
    public var unselectedItemTint: UIColor
    
    /// Badge color
    public var badge: UIColor
    
    /// Translucent
    public var translucent: Bool
}
