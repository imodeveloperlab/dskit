//
//  DSButtonAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public protocol DSButtonAppearanceProtocol {
    var accentColor: UIColor { get set }
    var supportColor: UIColor { get set }
}

public struct DSButtonAppearance: DSButtonAppearanceProtocol {
    
    public var accentColor: UIColor
    public var supportColor: UIColor
    
    public init(
        accentColor: UIColor,
        supportColor: UIColor
    ) {
        self.accentColor = accentColor
        self.supportColor = supportColor
    }
}
