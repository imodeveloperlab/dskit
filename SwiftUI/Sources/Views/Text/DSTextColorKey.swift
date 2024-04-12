//
//  DSTextColorKey.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public indirect enum DSTextColorKey: Equatable, Hashable {
    
    case font(DSTextFontKey)
    case dsColor(DSColorKey)
    
    public func color(for appearance: DSAppearance, and style: DSViewStyle) -> Color {
        switch self {
        case .font(font: let font):
            return color(for: font, appearance: appearance, viewStyle: style)
        case .dsColor(let customColor):
            return customColor.color(for: appearance, and: style)
        }
    }
    
    public func color(for font: DSTextFontKey, appearance: DSAppearance, viewStyle: DSViewStyle) -> Color {
        uiColor(for: font, appearance: appearance, viewStyle: viewStyle).color
    }
    
    public func uiColor(for font: DSTextFontKey, appearance: DSAppearance, viewStyle: DSViewStyle) -> UIColor {
        
        let designableTextColor: DSTextAppearanceProtocol
        
        switch viewStyle {
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
            return uiColor(for: font, appearance: appearance, viewStyle: viewStyle)
        case .smallHeadline:
            return designableTextColor.headline
        case .smallSubtitle:
            return designableTextColor.subheadline
        case .largeHeadline:
            return designableTextColor.headline
        }
    }
}
