//
//  DSTextStyle.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public indirect enum DSTextStyle: Equatable, Hashable {
    
    case textFont(DSTextFont)
    case textFontWithColor(DSTextFont, DSColor)
    case reStyleWithColor(DSTextStyle, DSColor)
    
    func textStyle(for appearance: DSAppearance) -> (font: DSTextFont, color: DSTextColor) {
        switch self {
        case .textFont(let font):
            return (font: font, color: DSTextColor.font(font))
        case .textFontWithColor(let font, let color):
            return (font: font, color: .dsColor(color))
        case .reStyleWithColor(let textStyle, let color):
            return (font: .fontWithSize(textStyle.dsTextFont, textStyle.dsTextFont.pointSize(for: appearance)), color: .dsColor(color))
        }
    }
    
    var dsTextFont: DSTextFont {
        return switch self {
        case .textFont(let font):
            font
        case .textFontWithColor(let font, _):
            font
        case .reStyleWithColor(let style, _):
            style.dsTextFont
        }
    }
    
    func font(for appearance: DSAppearance) -> Font {
        dsTextFont.font(for: appearance)
    }
    
    func color(for appearance: DSAppearance, and viewStyle: DSViewStyle) -> Color {
        textStyle(for: appearance).color.color(for: appearance, and: viewStyle)
    }
    
    func size(_ appearance: DSAppearance) -> CGFloat {
        dsTextFont.uiFont(for: appearance).pointSize
    }
}


public extension DSTextStyle {
    
    static var title1: DSTextStyle {
        .textFont(.title1)
    }
    
    static var title2: DSTextStyle {
        .textFont(.title2)
    }
    
    static var title3: DSTextStyle {
        .textFont(.title3)
    }
    
    static var callout: DSTextStyle {
        .textFont(.callout)
    }
    
    static var caption1: DSTextStyle {
        .textFont(.caption1)
    }
    
    static var caption2: DSTextStyle {
        .textFont(.caption2)
    }
    
    static var footnote: DSTextStyle {
        .textFont(.footnote)
    }
    
    static var largeTitle: DSTextStyle {
        .textFont(.largeTitle)
    }
    
    static var body: DSTextStyle {
        .textFont(.body)
    }
    
    static var headline: DSTextStyle {
        .textFont(.headline)
    }
    
    static var subheadline: DSTextStyle {
        .textFont(.subheadline)
    }

    static var smallHeadline: DSTextStyle {
        .textFont(.fontWithSize(.headline, 14))
    }
    
    static var smallSubtitle: DSTextStyle {
        .textFont(.fontWithSize(.subheadline, 12))
    }
    
    static var largeHeadline: DSTextStyle {
        .textFont(.fontWithSize(.headline, 30))
    }
}
