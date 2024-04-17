//
//  UIEdgeInsetsExtension.swift
//  DSKit
//
//  Created by Borinschi Ivan on 11.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    
    /// Transform UIEdgeInsets in to NSDirectionalEdgeInsets
    var directionalEdgeInsets: NSDirectionalEdgeInsets {
        
        return NSDirectionalEdgeInsets(top: top,
                                       leading: left,
                                       bottom: bottom,
                                       trailing: right)
    }
    
    var zeroLeftRightDirectionalEdgeInsets: NSDirectionalEdgeInsets {
        
        return NSDirectionalEdgeInsets(top: top,
                                       leading: 0,
                                       bottom: bottom,
                                       trailing: 0)
    }
    
    var groupedGridDirectionalEdgeInsets: NSDirectionalEdgeInsets {
        
        return NSDirectionalEdgeInsets(top: top,
                                       leading: left,
                                       bottom: bottom,
                                       trailing: right)
    }
}
