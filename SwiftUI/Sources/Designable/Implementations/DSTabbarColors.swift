//
//  DSTabbarAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public struct DSTabbarAppearance: DSTabBarColorsProtocol {
    
    /// Init tabbar colors
    /// - Parameters:
    ///   - barTint: UIColor
    ///   - itemTint: UIColor
    ///   - unselectedItemTint: UIColor
    ///   - badge: UIColor
    ///   - translucent: Bool
    public init(
        barTint: UIColor,
        itemTint: UIColor,
        unselectedItemTint: UIColor,
        badge: UIColor,
        translucent: Bool = false
    ) {
        
        self.barTint = barTint
        self.itemTint = itemTint
        self.unselectedItemTint = unselectedItemTint
        self.badge = badge
        self.translucent = translucent
    }
    
    public var barTint: UIColor
    public var itemTint: UIColor
    public var unselectedItemTint: UIColor
    public var badge: UIColor
    public var translucent: Bool
}