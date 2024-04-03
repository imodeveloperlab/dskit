//
//  DSTextColor.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public indirect enum DSTextColor: Equatable, Hashable {
    
    case font(DSTextFont)
    case custom(DSColor)
    
    /// Get text color
    /// - Parameter designableTextColor: DSDesignableTextColor
    /// - Returns: UIColor
    public func getColor(appearance: DSAppearance, colorGroup: DSViewStyle) -> UIColor {
        switch self {
        case .font(font: let font):
            return color(for: font, appearance: appearance, colorGroup: colorGroup)
        case .custom(let customColor):
            return customColor.styledColorDemo(from: appearance, and: colorGroup)
        }
    }
    
    public func color(for font: DSTextFont, appearance: DSAppearance, colorGroup: DSViewStyle) -> UIColor {
        
        let designableTextColor: DSDesignableTextColor
        
        switch colorGroup {
        case .primary:
            designableTextColor = appearance.primaryView.text
        case .secondary:
            designableTextColor = appearance.secondaryView.text
        }
        
        switch font {
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
        case .custom(_):
            return UIColor.black
        case .fontWithSize(let font, _):
            return color(for: font, appearance: appearance, colorGroup: colorGroup)
        }
    }
    
    public func color(appearance: DSAppearance, colorGroup: DSViewStyle) -> Color {
        Color(uiColor: getColor(appearance: appearance, colorGroup: colorGroup))
    }
}
