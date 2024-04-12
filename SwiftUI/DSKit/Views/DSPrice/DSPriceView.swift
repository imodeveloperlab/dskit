//
//  DSPrice.swift
//  DSKit
//
//  Created by Borinschi Ivan on 21.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import SwiftUI

public struct DSPriceView: View {
    
    @Environment(\.appearance) var appearance: DSAppearance
    let amount: String
    let regularAmount: String?
    let currency: String
    var discountBadge: String?
    var textFont: DSTextFontKey
    var color: Color?
    
    public init(price: DSPrice, size: DSTextFontKey, color: Color? = nil) {
        self.amount = price.amount
        self.currency = price.currency
        self.regularAmount = price.regularAmount
        self.discountBadge = price.discountBadge
        self.textFont = size
        self.color = color
    }
    
    var amountColor: DSColorKey {
        if let color {
            .color(color)
        } else {
            .price(.regularAmount)
        }
    }
    
    public var body: some View {
        
        DSHStack(spacing: .small) {
            
            DSHStack(spacing: .zero) {
                DSText(currency)
                    .dsTextStyle(textFont, amountColor)
                DSText(amount)
                    .dsTextStyle(textFont, amountColor)
            }
            
            if let regularAmount = regularAmount {
                DSHStack(spacing: .zero) {
                    DSText(regularAmount)
                        .dsTextStyle(textFont, amountColor)
                        .opacity(0.5)
                }
                .strikethrough()
            }
            
            if let discountBadge = discountBadge {
                DSText(discountBadge)
                    .dsTextStyle(textFont, textFont.pointSize(for: appearance) * 0.72, .price(.badgeText))
                    .dsPadding(.horizontal, .regular)
                    .dsPadding(.vertical, .custom(2))
                    .dsBackground(.price(.badgeBackground))
                    .cornerRadius(4)
            }
        }
    }
}

struct Testable_DSPrice: View {
    let price = DSPrice(amount: "100", regularAmount: "250", currency: "$", discountBadge: "10% OFF")
    var body: some View {
        DSPriceView(price: price, size: .title1)
        DSPriceView(price: price, size: .title2)
        DSPriceView(price: price, size: .title3)
        DSPriceView(price: price, size: .headline)
        DSPriceView(price: price, size: .subheadline)
        DSPriceView(price: price, size: .caption1, color: .green)
        DSPriceView(price: price, size: .caption2, color: .green)
        DSPriceView(price: price, size: .footnote)
        DSPriceView(price: price, size: .fontWithSize(.headline, 20))
    }
}

struct DSPrice_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { 
            DSPreview {
                Testable_DSPrice()
            }
            //.dsLayoutDebug()
        }
    }
}
