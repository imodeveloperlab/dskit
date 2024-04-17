//
//  DSTextParagraphType.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

enum DSTextParagraphType: Equatable, Hashable {
    case attributed(text: NSAttributedString)
    case text(icon: UIImage?, text: String, font: UIFont, color: DSTextColor)
    case price(price: DSPrice, size: DSPrice.DisplaySize, color: DSPrice.DisplayColor)
    case symbol(sfSymbol: String, style: DSSFSymbolConfigStyle, tint: DSTextColor)
    case symbols(sfSymbols: [String], style: DSSFSymbolConfigStyle, tint: DSTextColor)
    case image(image: UIImage, size: CGSize)
    case badge(text: String, type: DSTextType, backgroundColor: UIColor, cornerRadius: CGFloat)
}
