//
//  DSTextType.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSTextType: Equatable, Hashable {
    
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case headlineWithSize(CGFloat)
    case subheadline
    case subheadlineWithSize(CGFloat)
    case body
    case callout
    case caption1
    case caption2
    case footnote
    case text(font: DSTextFont, color: DSTextColor)
    case custom(font: UIFont, color: UIColor)
    
    public var style: (font: DSTextFont, color: DSTextColor) {
        
        var color = DSTextColor.title1
        var font = DSTextFont.title1
        
        switch self {
        case .title1:
            color = DSTextColor.title1
            font = DSTextFont.title1
        case .title2:
            color = DSTextColor.title2
            font = DSTextFont.title2
        case .title3:
            color = DSTextColor.title3
            font = DSTextFont.title3
        case .headline:
            color = DSTextColor.headline
            font = DSTextFont.headline
        case .subheadline:
            color = DSTextColor.subheadline
            font = DSTextFont.subheadline
        case .body:
            color = DSTextColor.body
            font = DSTextFont.body
        case .callout:
            color = DSTextColor.callout
            font = DSTextFont.callout
        case .caption1:
            color = DSTextColor.caption1
            font = DSTextFont.caption1
        case .caption2:
            color = DSTextColor.caption2
            font = DSTextFont.caption2
        case .footnote:
            color = DSTextColor.footnote
            font = DSTextFont.footnote
        case .custom(font: let customFont, color: let customColor):
            color = DSTextColor.custom(customColor)
            font = DSTextFont.custom(customFont)
        case .largeTitle:
            color = DSTextColor.largeTitle
            font = DSTextFont.custom(DSAppearance.shared.main.fonts.largeTitle)
        case .headlineWithSize(let size):
            color = DSTextColor.headline
            font = DSTextFont.custom(DSAppearance.shared.main.fonts.headline.withSize(size))
        case .text(font: let customFont, color: let customColor):
            color = customColor
            font = customFont
        case .subheadlineWithSize(let size):
            color = DSTextColor.subheadline
            font = DSTextFont.custom(DSAppearance.shared.main.fonts.subheadline.withSize(size))
        }
        
        return (font: font, color: color)
    }
}
