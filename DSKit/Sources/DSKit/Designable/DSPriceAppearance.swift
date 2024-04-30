//
//  CurrencyColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 01.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public protocol DSPriceAppearanceProtocol {
    var regularAmount: UIColor { get set }
    var badgeBackground: UIColor { get set }
    var badgeText: UIColor { get set }
    var badgeCornerRadius: CGFloat { get set }
}

public enum DSPriceColorKey {
    case regularAmount
    case badgeBackground
    case badgeText
}

extension DSPriceAppearanceProtocol {
    func color(key: DSPriceColorKey) -> Color {
        switch key {
        case .regularAmount:
            regularAmount.color
        case .badgeBackground:
            badgeBackground.color
        case .badgeText:
            badgeText.color
        }
    }
}

public struct DSPriceAppearance: DSPriceAppearanceProtocol {
    
    public init(
        regularAmount: UIColor,
        badgeBackground: UIColor = .red, 
        badgeText: UIColor = .white,
        badgeCornerRadius: CGFloat = 4.0
    ) {
        self.badgeText = badgeText
        self.badgeBackground = badgeBackground
        self.badgeCornerRadius = badgeCornerRadius
        self.regularAmount = regularAmount
    }
    
    public var regularAmount: UIColor
    public var badgeBackground: UIColor
    public var badgeText: UIColor
    public var badgeCornerRadius: CGFloat
}
