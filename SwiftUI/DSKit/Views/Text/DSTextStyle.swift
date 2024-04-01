//
//  DSTextStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public enum DSTextStyle: Equatable, Hashable {
    
    case style(DSTextFont)
    case styleWithSize(DSTextFont, CGFloat)
    case styleWithSizeAndColor(DSTextFont, CGFloat, UIColor)
    
    func style(appearance: DSAppearance) -> (font: DSTextFont, color: DSTextColor) {
        switch self {
        case .style(let font):
            return (font: font, color: DSTextColor.font(font))
        case .styleWithSize(let font, let size):
            return (font: .fontWithSize(font, size), color: DSTextColor.font(font))
        case .styleWithSizeAndColor(let font, let size, let color):
            return (font: .fontWithSize(font, size), color: DSTextColor.custom(color))
        }
    }
    
    var font: DSTextFont {
        return switch self {
        case .style(let font):
            font
        case .styleWithSize(let font, _):
            font
        case .styleWithSizeAndColor(let font, _, _):
            font
        }
    }
    
    func size(_ appearance: DSAppearance) -> CGFloat {
        font.getUIFont(from: appearance).pointSize
    }
}


public extension DSTextStyle {
    
    static var title1: DSTextStyle {
        .style(.title1)
    }
    
    static var title2: DSTextStyle {
        .style(.title2)
    }
    
    static var title3: DSTextStyle {
        .style(.title3)
    }
    
    static var callout: DSTextStyle {
        .style(.callout)
    }
    
    static var caption1: DSTextStyle {
        .style(.caption1)
    }
    
    static var caption2: DSTextStyle {
        .style(.caption2)
    }
    
    static var footnote: DSTextStyle {
        .style(.footnote)
    }
    
    static var largeTitle: DSTextStyle {
        .style(.largeTitle)
    }
    
    static var body: DSTextStyle {
        .style(.body)
    }
    
    static var headline: DSTextStyle {
        .style(.headline)
    }
    
    static var subheadline: DSTextStyle {
        .style(.subheadline)
    }

    static var smallHeadline: DSTextStyle {
        .styleWithSize(.headline, 14)
    }
    
    static var smallSubtitle: DSTextStyle {
        .styleWithSize(.subheadline, 12)
    }
    
    static var largeHeadline: DSTextStyle {
        .styleWithSize(.headline, 30)
    }
}
