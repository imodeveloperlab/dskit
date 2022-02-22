//
//  DSViewModelStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// View model display style
public struct DSViewModelStyle: Equatable, Hashable {
    
    public var colorStyle: DSViewModelColorStyle = .default
    public var cornerStyle: DSViewModelCornersStyle = .default
    public var borderStyle: DSViewModelBorderStyle = .none
    public var shadowStyle: DSViewModelShadowStyle = .none
    public var displayStyle: DSViewModelDisplayStyle = .default
    
    public init(colorStyle: DSViewModelColorStyle = .default,
                cornerStyle: DSViewModelCornersStyle = .default,
                borderStyle: DSViewModelBorderStyle = .none,
                shadowStyle: DSViewModelShadowStyle = .none,
                displayStyle: DSViewModelDisplayStyle = .default) {
        
        self.colorStyle = colorStyle
        self.cornerStyle = cornerStyle
        self.borderStyle = borderStyle
        self.shadowStyle = shadowStyle
        self.displayStyle = displayStyle
    }
}
