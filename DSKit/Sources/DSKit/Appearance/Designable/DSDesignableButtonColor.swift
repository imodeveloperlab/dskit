//
//  DSDesignableButtonColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Button colors
public struct DSDesignableButtonColor: Equatable, Hashable {
    
    /// Init designable button colors
    /// - Parameters:
    ///   - background: UIColor
    ///   - title: UIColor
    public init(background: UIColor, title: UIColor) {
        self.background = background
        self.title = title
    }
    
    /// Button background color
    public var background: UIColor
    
    /// Button title color
    public var title: UIColor
}
