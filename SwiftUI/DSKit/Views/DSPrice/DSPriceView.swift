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
    var size: DSTextType
    var color: DisplayColor
    
    public init(price: DSPrice, size: DSTextType, color: DisplayColor = .default) {
        self.amount = price.amount
        self.currency = price.currency
        self.regularAmount = price.regularAmount
        self.discountBadge = price.discountBadge
        self.size = size
        self.color = color
    }
    
    public enum DisplayColor {
        case `default`
        case custom(Color)
    }
    
    public var body: some View {
        switch color {
        case .custom(let customColor):
            DSHStack(spacing: .small) {
                
                DSHStack(spacing: .zero) {
                    DSText(currency.currencySymbol, size, color: .customColor(customColor))
                    DSText(amount, size, color: .customColor(customColor))
                }
                
                if let regularAmount = regularAmount {
                    DSHStack(spacing: .zero) {
                        DSText(currency.currencySymbol, size, color: .customColor(customColor.opacity(0.5)))
                        DSText(regularAmount, size, color: .customColor(customColor.opacity(0.5)))
                    }.strikethrough()
                }
                
                if let discountBadge = discountBadge {
                    DSText(discountBadge, size, color: .priceBadgeText)
                        .dsPadding(.horizontal, .small)
                        .dsPadding(.vertical, .custom(2))
                        .background(appearance.price.badgeBackground.color)
                        .dsCornerRadius()
                        .scaleEffect(CGSize(width: 0.75, height: 0.75))
                }
            }
        default:
            DSHStack(spacing: .small) {
                
                DSHStack(spacing: .zero) {
                    DSText(currency.currencySymbol, size, color: .priceAmount)
                    DSText(amount, size, color: .priceAmount)
                }
                
                if let regularAmount = regularAmount {
                    DSHStack(spacing: .zero) {
                        DSText(currency.currencySymbol, size, color: .priceRegularAmount)
                        DSText(regularAmount, size, color: .priceRegularAmount)
                    }.strikethrough()
                }
                
                if let discountBadge = discountBadge {
                    DSText(discountBadge, size, color: .priceBadgeText)
                        .dsPadding(.horizontal, .regular)
                        .dsPadding(.vertical, .custom(2))
                        .background(appearance.price.badgeBackground.color)
                        .cornerRadius(4)
                        .scaleEffect(CGSize(width: 0.75, height: 0.75))
                }
            }
        }
    }
    
    private func priceColor(for color: DisplayColor) -> Color {
        switch color {
        case .default:
            return Color(uiColor: appearance.price.amount)
        case .custom(let customColor):
            return customColor
        }
    }
    
    private func regularPriceColor(for color: DisplayColor) -> Color {
        return Color(uiColor: appearance.price.regularAmount)
    }
    
    private func badgeColor(for color: DisplayColor) -> Color {
        return Color(uiColor: appearance.price.badgeBackground)
    }
}

struct Testable_DSPrice: View {
    let price = DSPrice(amount: "100", regularAmount: "100", currency: "$", discountBadge: "10% OFF")
    var body: some View {
        DSPriceView(price: price, size: .font(.headline))
        DSPriceView(price: price, size: .font(.subheadline))
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
