//
//  DSButtonAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public protocol DSButtonAppearanceProtocol {
    var background: UIColor { get set }
    var title: UIColor { get set }
}

public struct DSButtonAppearance: DSButtonAppearanceProtocol {
    
    public init(
        background: UIColor, title: UIColor
    ) {
        self.background = background
        self.title = title
    }
    
    public var background: UIColor
    public var title: UIColor
}
