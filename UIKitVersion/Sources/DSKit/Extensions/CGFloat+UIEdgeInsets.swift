//
//  CGFloat+UIEdgeInsets.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

extension CGFloat {
    
    /// Transform CGFloat to UIEdgeInsets with  CGFloat
    public var edgeInsets: UIEdgeInsets {
        return UIEdgeInsets(top: self, left: self, bottom: self, right: self)
    }
}
