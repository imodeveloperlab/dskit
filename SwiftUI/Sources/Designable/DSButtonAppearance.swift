//
//  DSButtonAppearance.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public protocol DSButtonAppearanceProtocol {
    var accentColor: UIColor { get set }
    var supportColor: UIColor { get set }
}

public extension DSButtonAppearanceProtocol {
    func color(key: DSButtonColorKey) -> Color {
        switch key {
        case .accentColor:
            accentColor.color
        case .supportColor:
            supportColor.color
        }
    }
}

public enum DSButtonColorKey {
    case accentColor
    case supportColor
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
