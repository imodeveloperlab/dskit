//
//  DSTextColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

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
    
    public func getFont(from appearance: DSAppearance) -> Font {
        var font: UIFont
        switch self {
        case .title1:
            font = appearance.fonts.title1
        case .title2:
            font = appearance.fonts.title2
        case .title3:
            font = appearance.fonts.title3
        case .headline:
            font = appearance.fonts.headline
        case .subheadline:
            font = appearance.fonts.subheadline
        case .body:
            font = appearance.fonts.body
        case .callout:
            font = appearance.fonts.callout
        case .caption1:
            font = appearance.fonts.caption1
        case .caption2:
            font = appearance.fonts.caption2
        case .footnote:
            font = appearance.fonts.footnote
        case .largeTitle:
            font = appearance.fonts.largeTitle
        case .headlineWithSize(let size):
            font = appearance.fonts.headline.withSize(size)
        case .bodyWithSize(let size):
            font = appearance.fonts.body.withSize(size)
        case .subheadlineWithSize(let size):
            font = appearance.fonts.subheadline.withSize(size)
        case .custom(let customFont):
            font = customFont
        }
        return Font(font)
    }
}
