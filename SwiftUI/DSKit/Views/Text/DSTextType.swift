//
//  DSTextType.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import SwiftUI

public enum DSTextType: Equatable, Hashable {
    
    case font(DSTextFont)
    case fontAndSize(DSTextFont, CGFloat)
    case fontSizeAndColor(DSTextFont, CGFloat, UIColor)
    
    func style(appearance: DSAppearance) -> (font: DSTextFont, color: DSTextColor) {
        switch self {
        case .font(let font):
            return (font: font, color: DSTextColor.font(font))
        case .fontAndSize(let font, let size):
            return (font: .fontWithSize(font, size), color: DSTextColor.font(font))
        case .fontSizeAndColor(let font, let size, let color):
            return (font: .fontWithSize(font, size), color: DSTextColor.custom(color))
        }
    }
}
