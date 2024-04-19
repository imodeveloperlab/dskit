//
//  Order4.swift
//  DSKit
//
//  Created by Ivan Borinschi on 21.12.2022.
//

import SwiftUI
import DSKit

struct Order4: View {
    
    @Environment(\.dismiss) var dismiss
    let viewModel = Order4Model()
    
    var body: some View {
        DSVStack(alignment: .center) {
            Spacer()
            DSVStack {
                DSText("You may also like").dsTextStyle(.subheadline)
                DSHScroll(data: viewModel.suggestedProducts, id: \.id) { product in
                    SuggestedProductView(product: product)
                }
            }
            DSButton(title: "Continue Shopping", rightSystemName: "bag.fill", action: {
                dismiss()
            })
        }
        .overlay(alignment: .center, content: {
            DSVStack(alignment: .center) {
                Spacer()
                DSImageView(systemName: "checkmark.circle.fill", size: 70, tint: .color(.green))
                    .dsPadding(.bottom, 30)
                DSText("It's Ordered").dsTextStyle(.largeHeadline)
                DSText("Hi John - thanks for your order,\nwe hope you enjoyed shopping\nwith us", multilineTextAlignment: .center)
                    .dsTextStyle(.subheadline)
                Spacer()
                Spacer()
            }
        })
        .dsScreen()
    }
}

extension Order4 {
    
    // MARK: - Suggested Product
    
    struct SuggestedProductView: View {
        let product: Data
        var body: some View {
            DSHStack(alignment: .center, spacing: .regular) {
                DSImageView(url: product.image, size: .size(width: 80, height: 60))
                    .dsCornerRadius()
                DSVStack(alignment: .leading, spacing: .small) {
                    DSText(product.title, multilineTextAlignment: .leading)
                        .dsTextStyle(.headline, 12)
                    DSText(product.subtitle, multilineTextAlignment: .leading)
                        .dsTextStyle(.smallSubtitle)
                    DSPriceView(price: product.price, size: .smallHeadline)
                }.frame(maxWidth: 160, alignment: .leading)
            }.dsCardStyle(padding: .regular)
        }
        struct Data: Identifiable {
            let id = UUID()
            let title: String
            let subtitle: String
            let price: DSPrice
            let image: URL?
        }
    }
}

// MARK: - View Model

final class Order4Model {
    
    let suggestedProducts: [Order4.SuggestedProductView.Data] = [
        .init(
            title: "New Balance All Fits",
            subtitle: "New Balance",
            price: DSPrice(amount: "250", regularAmount: "290", currency: "$"),
            image: sneakersWhiteOnYellowBg
        ),
        .init(
            title: "Big Pony Mesh Shoes",
            subtitle: "Nike",
            price: DSPrice(amount: "120", currency: "$"),
            image: sneakersThreePairs
        ),
        .init(
            title: "Mesh Long-Sleeve Sneakers All Fits",
            subtitle: "Reebok",
            price: DSPrice(amount: "145", currency: "$"),
            image: sneakersOnWhiteBg
        )
    ]
}

// MARK: - Testable

struct Testable_Order4: View {
    var body: some View {
        Order4()
    }
}

// MARK: - Preview

struct Order4_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_Order4() }
    }
}

// MARK: - Image Links

fileprivate let sneakersThreePairs = URL(string: "https://images.pexels.com/photos/2300334/pexels-photo-2300334.jpeg?cs=srgb&dl=pexels-adrian-dorobantu-2300334.jpg&fm=jpg")
fileprivate let sneakersWhiteOnYellowBg = URL(string: "https://images.pexels.com/photos/2421374/pexels-photo-2421374.jpeg?cs=srgb&dl=pexels-hoang-loc-2421374.jpg&fm=jpg")
fileprivate let sneakersOnWhiteBg = URL(string: "https://images.pexels.com/photos/1858404/pexels-photo-1858404.jpeg?cs=srgb&dl=pexels-athena-1858404.jpg&fm=jpg")
