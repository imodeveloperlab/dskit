//
//  DSTextColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

public enum DSTextColor: Equatable, Hashable {
    
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case subheadline
    case body
    case callout
    case caption1
    case caption2
    case footnote
    case brand
    case white
    case black
    case custom(UIColor)
    
    /// Get text color
    /// - Parameter designableTextColor: DSDesignableTextColor
    /// - Returns: UIColor
    public func getColor(designableTextColor: DSDesignableTextColor) -> UIColor {        
        
        switch self {
        case .largeTitle:
            return designableTextColor.largeTitle
        case .title1:
            return designableTextColor.title1
        case .title2:
            return designableTextColor.title2
        case .title3:
            return designableTextColor.title3
        case .headline:
            return designableTextColor.headline
        case .subheadline:
            return designableTextColor.subheadline
        case .body:
            return designableTextColor.body
        case .callout:
            return designableTextColor.callout
        case .caption1:
            return designableTextColor.caption1
        case .caption2:
            return designableTextColor.caption2
        case .footnote:
            return designableTextColor.footnote
        case .custom(let color):
            return color
        case .brand:
            return DSAppearance.shared.main.brandColor
        case .white:
            return UIColor.white
        case .black:
            return UIColor.black
        }
    }
}
