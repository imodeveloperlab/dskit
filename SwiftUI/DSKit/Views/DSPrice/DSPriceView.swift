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
    var textType: DSTextType
    var color: Color?
    
    public init(price: DSPrice, size: DSTextType, color: Color? = nil) {
        self.amount = price.amount
        self.currency = price.currency
        self.regularAmount = price.regularAmount
        self.discountBadge = price.discountBadge
        self.textType = size
        self.color = color
    }
    
    var amountColor: DSColor {
        if let color {
            .customColor(color)
        } else {
            .priceRegularAmount
        }
    }
    
    public var body: some View {
        
        DSHStack(spacing: .small) {
            
            DSHStack(spacing: .zero) {
                DSText(currency.currencySymbol, textType, color: amountColor)
                DSText(amount, textType, color: amountColor)
            }
            
            if let regularAmount = regularAmount {
                DSHStack(spacing: .zero) {
                    DSText(regularAmount, textType, color: amountColor).opacity(0.5)
                }
                .strikethrough()
                
            }
            
            if let discountBadge = discountBadge {
                DSText(discountBadge, .fontAndSize(textType.font, textType.size(appearance) * 0.60), color: .priceBadgeText)
                    .dsPadding(.horizontal, .regular)
                    .dsPadding(.vertical, .custom(2))
                    .background(appearance.price.badgeBackground.color)
                    .cornerRadius(4)
            }
        }
    }
}

struct Testable_DSPrice: View {
    let price = DSPrice(amount: "100", regularAmount: "250", currency: "$", discountBadge: "10% OFF")
    var body: some View {
        DSPriceView(price: price, size: .font(.title1))
        DSPriceView(price: price, size: .font(.title2))
        DSPriceView(price: price, size: .font(.title3))
        DSPriceView(price: price, size: .font(.headline))
        DSPriceView(price: price, size: .font(.subheadline))
        DSPriceView(price: price, size: .font(.caption1), color: .green)
        DSPriceView(price: price, size: .font(.caption2), color: .green)
        DSPriceView(price: price, size: .font(.footnote))
        DSPriceView(price: price, size: .fontAndSize(.headline, 20))
    }
}

struct DSPrice_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach { 
            DSPreview {
                Testable_DSPrice()
            }
            //.dsLayoutDebug()
        }
    }
}
