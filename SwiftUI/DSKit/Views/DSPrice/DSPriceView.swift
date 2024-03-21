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
    var size: DSDimension
    var color: DisplayColor
    
    public init(amount: String, regularAmount: String? = nil, currency: String, discountBadge: String? = nil, size: DSDimension = .regular, color: DisplayColor = .default) {
        self.amount = amount
        self.currency = currency
        self.regularAmount = regularAmount
        self.discountBadge = discountBadge
        self.size = size
        self.color = color
    }
    
    public init(price: DSPrice, size: DSDimension = .regular, color: DisplayColor = .default) {
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
            DSHStack(spacing: .smaller) {
                
                DSHStack(spacing: .zero) {
                    DSText(currency.currencySymbol, .headlineWithSize(scaledFontSize(for: size)), color: .customColor(customColor))
                    DSText(amount, .headlineWithSize(scaledFontSize(for: size)), color: .customColor(customColor))
                }
                
                if let regularAmount = regularAmount {
                    DSHStack(spacing: .zero) {
                        DSText(currency.currencySymbol, .headlineWithSize(scaledFontSize(for: size)), color: .customColor(customColor.opacity(0.5)))
                        DSText(regularAmount, .headlineWithSize(scaledFontSize(for: size)), color: .customColor(customColor.opacity(0.5)))
                    }.strikethrough()
                }
                
                if let discountBadge = discountBadge {
                    DSText(discountBadge, .headlineWithSize(scaledFontSize(for: size) * 0.75), color: .priceBadgeText)
                        .dsPadding(.horizontal, .smaller)
                        .dsPadding(.vertical, .extraSmall)
                        .background(appearance.price.badgeBackground.color)
                        .dsCornerRadius()
                }
            }
        default:
            DSHStack(spacing: .smaller) {
                
                DSHStack(spacing: .zero) {
                    DSText(currency.currencySymbol, .headlineWithSize(scaledFontSize(for: size)), color: .priceAmount)
                    DSText(amount, .headlineWithSize(scaledFontSize(for: size)), color: .priceAmount)
                }
                
                if let regularAmount = regularAmount {
                    DSHStack(spacing: .zero) {
                        DSText(currency.currencySymbol, .headlineWithSize(scaledFontSize(for: size)), color: .priceRegularAmount)
                        DSText(regularAmount, .headlineWithSize(scaledFontSize(for: size)), color: .priceRegularAmount)
                    }.strikethrough()
                }
                
                if let discountBadge = discountBadge {
                    DSText(discountBadge, .headlineWithSize(scaledFontSize(for: size) * 0.75), color: .priceBadgeText)
                        .dsPadding(.horizontal, .small)
                        .dsPadding(.vertical, .extraSmall)
                        .background(appearance.price.badgeBackground.color)
                        .cornerRadius(4)
                }
            }
        }
    }
    
    private func scaledFontSize(for size: DSDimension) -> CGFloat {
        
        let regularSize: CGFloat = 12
        
        switch size {
        case .extraSmall:
            return regularSize * 0.7
        case .smaller:
            return regularSize * 0.8
        case .small:
            return regularSize * 0.9
        case .regular:
            return regularSize
        case .medium:
            return regularSize * 1.2
        case .mediumLarge:
            return regularSize * 1.4
        case .large:
            return regularSize * 1.6
        case .extraLarge:
            return regularSize * 1.8
        case .larger:
            return regularSize * 2.0
        case .largest:
            return regularSize * 2.2
        case .custom(let customSize):
            return customSize
//        case .size(width: _, height: _):
//            return regularSize
        case .zero:
            return regularSize
        case .fillUpTheSpace:
            return regularSize
        case .designSize(let multiplier):
            return regularSize * multiplier
        case .none:
            return regularSize
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

struct DSPrice_Previews: PreviewProvider {
    static var previews: some View {
        PreviewForEach {
            DSFullScreen {
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .extraSmall)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .smaller)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .small)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .regular)
                    .dsPadding(.smaller)
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .regular)
                    .dsPadding(.regular)
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .regular)
                    .dsPadding(.medium)
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .medium)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .mediumLarge)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .extraLarge)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .larger)
                DSPriceView(amount: "1.50", regularAmount: "2.00", currency: "$", discountBadge: "10% OFF", size: .largest, color: .custom(.red))
            }
        }
    }
}
