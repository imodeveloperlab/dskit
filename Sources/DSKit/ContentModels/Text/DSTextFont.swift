//
//  DSTextColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSTextFont: Equatable, Hashable {
    
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case headlineWithSize(CGFloat)
    case subheadline
    case subheadlineWithSize(CGFloat)
    case body
    case bodyWithSize(CGFloat)
    case callout
    case caption1
    case caption2
    case footnote
    case custom(UIFont)
    
    public func getFont() -> UIFont {
        
        var font = UIFont.systemFont(ofSize: 12)
        
        switch self {
        case .title1:
            font = DSAppearance.shared.main.fonts.title1
        case .title2:
            font = DSAppearance.shared.main.fonts.title2
        case .title3:
            font = DSAppearance.shared.main.fonts.title3
        case .headline:
            font = DSAppearance.shared.main.fonts.headline
        case .subheadline:
            font = DSAppearance.shared.main.fonts.subheadline
        case .body:
            font = DSAppearance.shared.main.fonts.body
        case .callout:
            font = DSAppearance.shared.main.fonts.callout
        case .caption1:
            font = DSAppearance.shared.main.fonts.caption1
        case .caption2:
            font = DSAppearance.shared.main.fonts.caption2
        case .footnote:
            font = DSAppearance.shared.main.fonts.footnote
        case .largeTitle:
            font = DSAppearance.shared.main.fonts.largeTitle
        case .headlineWithSize(let size):
            font = DSAppearance.shared.main.fonts.headline.withSize(size)
        case .bodyWithSize(let size):
            font = DSAppearance.shared.main.fonts.body.withSize(size)
        case .subheadlineWithSize(let size):
            font = DSAppearance.shared.main.fonts.subheadline.withSize(size)
        case .custom(let customFont):
            font = customFont
        }
        
        return font
    }
}
